//
//  WeatherData.swift
//  worksmart
//
//  Created by Tin Le on 2/22/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
struct WeatherData {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


class WeatherJsonMapper {
    func map(_ dictionary: [String: Any]) -> WeatherData? {
        guard let id = dictionary["id"] as? Int else { return nil}
        guard let main  = dictionary["main"] as? String else { return nil}
        guard let description = dictionary["description"] as? String else {return nil}
        guard let icon = dictionary["icon"] as? String else {return nil}
        return WeatherData(id: id, main: main, description: description, icon: icon)
    }
    
}
