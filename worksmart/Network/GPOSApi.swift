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
    func getWeather(city: String, apiKey: String) -> AnyPublisher<String, ApiError>
}

class GposService {
    private let API_KEY = "eb05f6219511c8637d3d7c10274031ed"
    func getWeather(city: String, completion: @escaping (_ success: Bool,
        _ dictionary:[String: Any]?) -> Void) {
        let url = ApiParam.WEATHER_API_URL + ApiParam.CITY_KEY + "=\(city)&" + ApiParam.APP_ID_KEY + "=\(API_KEY)"
        
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
    
    /*?
     let headers: HTTPHeaders = [
         "Authorization": "Bearer "+ access_token! //If using JWT
     ]
     */
    
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

        AF.request(ApiParam.GPOS_API_REGISTER, method: .post, parameters: postParams, encoding:JSONEncoding.default , headers: headers)
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
               completion: @escaping (_ success: Bool,_ profile: AccountProfile?) -> Void) {
        AF.request("", method: .post)
            .responseDecodable (of: AccountProfile.self) { response in
                guard let profile = response.value   else {
                    print( "profile retrieve success:")
                    completion(false, nil)
                    return
                }
                
                completion(true, profile)
        }
    }
    
    private func getError(statusCode: Int) -> String {
        switch statusCode {
        case 400...406:
            return "Unauthorized"
        
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
    
    private struct ApiParam {
        static let WEATHER_API_URL = "https://api.openweathermap.org/data/2.5/weather?"
        static let CITY_KEY = "q"
        static let APP_ID_KEY = "appid"
        static let GPOS_API_REGISTER = "https://gposwebapi.azurewebsites.net/users/register"
        
    }
}


