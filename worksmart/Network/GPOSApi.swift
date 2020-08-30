//
//  GPOSApi.swift
//  worksmart
//
//  Created by Tin Le on 2/19/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine
import Alamofire
import SwiftyJSON

protocol GposApi {
    func signIn(email: String, password: String)->AnyPublisher<String, ApiError>
    func getProfile(email: String)->AnyPublisher<String, ApiError>
    func getReports()
    func signUp(name:String, email: String, phone: String, businessId:String)->AnyPublisher<String, ApiError>
    
    //Test Api
    //openWeatherApi key: eb05f6219511c8637d3d7c10274031ed
    
    //login creds ["UserName": "testuser2", "UserPassword": "password2"]
    func getWeather(city: String, apiKey: String) -> AnyPublisher<String, ApiError>
}

class GposService {
    private let API_KEY = "eb05f6219511c8637d3d7c10274031ed"
    func getWeather(city: String, completion: @escaping (_ success: Bool,
        _ dictionary:[String: Any]?) -> Void) {
        let url = ApiConstants.WEATHER_API_URL + ApiConstants.CITY_KEY + "=\(city)&" + ApiConstants.APP_ID_KEY + "=\(API_KEY)"
        
        AF.request(url, method: .get)
            .responseJSON { response in
                //debugPrint("response \(response)")
                if let jsonData = response.data {
                    let json = JSON(jsonData)
                    print("json \(json)")
                    print("weather \(json["weather"])")
                    
                    let weatherJson = json["weather"]
                    print("weather \(weatherJson["description"])")
                    completion(true, weatherJson.dictionary)
                    
                } else {
                    completion(true, nil)
                }
        }
    }
    
    func register(firstName: String, lastName: String, userName: String, password: String,
                  completion: @escaping (_ success: Bool,_ json: String?) -> Void) {
        let postParams = [
            "firstName" : firstName,
            "lastName" : lastName,
            "username" : userName,
            "password" : password,
            "appName" : "worksmart"
            ] as [String: String]
        
        printJson(dic: postParams)
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(ApiConstants.GPOS_API_REGISTER, method: .post,
                   parameters: postParams,
                   encoding:JSONEncoding.default ,
                   headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .failure:
                    if let statusCode = response.response?.statusCode {
                        print("error: \(self.getError(statusCode: statusCode))")
                    }
                case .success(let value):
                    print(" value \(value)")
                    if let jsonData = response.data {
                        let json = JSON(jsonData)
                        print("json \(json)")
                        completion(true, json.stringValue)
                    } else {
                        print("error: \(response)")
                        completion(true, "Error registering !!!")
                    }
                }
        }
    }
    
    func login(userName: String, password: String,
               completion: @escaping (_ success: Bool, _ profile: AccountProfile?) -> Void) {
        let postParams = [
            "username" : userName,
            "password" : password
            
            ] as [String: String]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(ApiConstants.GPOS_API_LOGIN, method: .post,
                   parameters: postParams,
                   encoding:JSONEncoding.default ,
                   headers: headers)
            .responseDecodable (of: AccountProfile.self) { response in
                //debugPrint(response)
                guard let profile = response.value   else {
                    print( "profile retrieve failed: \(response)")
                    completion(false, nil)
                    return
                }
                print( "profile retrieve success: \(response)")
                completion(true, profile)
        }
    }
    
    func getProviders(businessId: String, completion: @escaping (_ success: Bool) -> Void) {
        
    }
    
    
    //employeeId is also known as providerId in api backend
    func getSaleReport(employeeId: String, requestToken: String, completion: @escaping (_ success: Bool) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization" : String(format: "Bearer: @%", requestToken)
        ]
        
        let providerAPI = String(format: ApiConstants.GPOS_GETPROVIDER_INFO, employeeId)
        
        AF.request(providerAPI, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: UserProfile.self) { response in
                guard let _ = response.value  else {
                    print("failed to get profile")
                    completion(false)
                    return
                }
                completion(true)
        }
    }
    
    func getProductList(completion: @escaping (_ success: Bool) -> Void) {
        let authorizeToken = generateAuthorizeToken()
        let sha1Token = ApiUtil.encryptHMACSHA1(key: authorizeToken, data: DateUtil.getTodayDate())
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization" : String(format: "Basic: @%", authorizeToken),
            "Token" : sha1Token
        ]
        
        AF.request(ApiConstants.GPOS_API_RESTAURANT_TEST_GET_PRODUCT_CATEGORIES, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: UserProfile.self) { response in
                guard let _ = response.value else {
                    debugPrint(response)
                    print("get products failed")
                    completion(false)
                    return
                }
                completion(true)
        }
    }
    
    func getCatgegories(token: String, completion: @escaping (_ success: Bool, _ data: [Category]) -> Void) {
        
        let bearerToken = "Bearer \(token)"
        let headers: HTTPHeaders = [
            "Authorization" : bearerToken,
            "Content-Type": "application/json"
        ]
        
        AF.request(ApiConstants.GPOS_API_RESTAURANT_TEST_GET_PRODUCT_CATEGORIES,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: [Category].self) { response in
                //debugPrint(response)
                guard let _ = response.value else {
                    print("get products failed")
                    debugPrint(response)
                    completion(false, [])
                    return
                }
                completion(true, (response.value)!)
        }
    }
    
    private func generateAuthorizeToken() -> String {
        let tokenString = ApiConstants.USERNAME + ":" + ApiConstants.PASSWORD
        return ApiUtil.encodeBase64String(input: tokenString)
    }
    
    private func getError(statusCode: Int) -> String {
        switch statusCode {
        case 400...406:
            return "Unauthorized"
            
        case 204:
            return "No contents"
            
        default:
            return "Unknown error"
        }
    }
    
    private func printJson(dic: [String: String]) {
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(dic) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        }
    }
    
    private struct ApiConstants {
        static let WEATHER_API_URL = "https://api.openweathermap.org/data/2.5/weather?"
        static let CITY_KEY = "q"
        static let APP_ID_KEY = "appid"
        static let GPOS_API_REGISTER = "https://gposwebapi.azurewebsites.net/users/register"
        static let GPOS_API_LOGIN = "https://gposwebapi.azurewebsites.net/users/authenticate"
        static let GPOS_API_NEW = "https://api.gposdev.com"
        static let GPOS_GETPROVIDER_INFO = "https://gposwebapi.azurewebsites.net/20002/api/providers/%%?start=1/1/2020&end=3/1/2020"
        
        //OLD API
        static let USERNAME = "admin"
        static let PASSWORD = "6786716888"
        static let RESTAURANT_TEST_API = "30002"
        static let SALON_TEST_API = "30002"
        static let GPOS_API_CORE_BASE = "https://www.gposdev.com/"
        static let GPOS_API_RESTAURANT_TEST_GET_PRODUCT_CATEGORIES = "https://api.gposdev.com/30001/api/Categories"
        
        //use https://www.gposdev.com/30002/Help
        
    }
}


