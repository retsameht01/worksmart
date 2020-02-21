//
//  ProfileVM.swift
//  worksmart
//
//  Created by Tin Le on 2/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Combine
import SwiftUI

class ProfileVM: ObservableObject {
    private let gposService = GposService()
    let didChange = PassthroughSubject<ProfileVM, Never>()
    
    @Published var weatherInfo: String = "loading weather..." {
        didSet {
            didChange.send(self)
        }
    }
    
    func getWeather(city: String) {
        gposService.getWeather(city: city, completion: {_, json in
            print("json result")
            self.weatherInfo = json
        })
    }
}
