//
//  AccountProfile.swift
//  worksmart
//
//  Created by Tin Le on 4/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation

struct AccountProfile: Decodable {
    let lastName: String
    let firstName: String
    let userName: String
    let password: String
    let appName: String
    let token: String
    let refreshToken: String
}
