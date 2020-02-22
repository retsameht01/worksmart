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
    
    private struct ApiParam {
        static let WEATHER_API_URL = "https://api.openweathermap.org/data/2.5/weather?"
        static let CITY_KEY = "q"
        static let APP_ID_KEY = "appid"
    }
}


