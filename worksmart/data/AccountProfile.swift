//
//  AccountProfile.swift
//  worksmart
//
//  Created by Tin Le on 4/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation

struct AccountProfile: Decodable {
    let firstName: String
    let lastName: String
    let username: String
    let password: String?
    let appName: String
    let token: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "firstName"
        case lastName = "lastName"
        case username = "username"
        case password = "password"
        case appName = "appName"
        case token = "token"
        case refreshToken = "refreshToken"
    }
}
