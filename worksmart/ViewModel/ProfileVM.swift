//
//  ProfileVM.swift
//  worksmart
//
//  Created by Tin Le on 2/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Combine
import SwiftUI
import SwiftyJSON

class ProfileVM: ObservableObject {
    private let productRepo = ProductsRepo()
    let profileManager: ProfileManager = ProfileManager()
    let didChange = PassthroughSubject<ProfileVM, Never>()
    
    @Published var weatherInfo: String = "loading weather..." {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var allProducts: [Category] = [] {
        didSet{
            didChange.send(self)
        }
    }
    
    func getWeather(city: String) {
        /*
        gposService.getWeather(city: city, completion: {_, weatherJson in
            print("json result")
            if let weatherJson = weatherJson {
                let weather = WeatherData(
                id: weatherJson["id"] as! Int,
                main: weatherJson["main"] as! String,
                description: weatherJson["description"] as! String,
                icon: weatherJson["icon"] as! String)
                self.weatherInfo = "Forecast \(weather.main), \(weather.description)"
                print("parse complete")
            } else {
                self.weatherInfo = "Unable to parse weather"
            }
        })
 
            */
    }
    
    func loadProducts() {
        let token = profileManager.getTokens()[AppConstants.userToken] ?? ""
        productRepo.getProducts(token: token, storeId: "30002") { data in
            self.allProducts = data
        }
    }
}
