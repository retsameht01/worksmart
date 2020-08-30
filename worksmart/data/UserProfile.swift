//
//  UserProfile.swift
//  worksmart
//
//  Created by Tin Le on 2/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation

struct UserProfile : Decodable {
    let id: String
    let name: String
    let commissionRate: Float
    let sales: Double
    let standardCost: Double
    let tips: Double
    let cashCollected: Double
    let commission: Double
    let taxableCashPaymentRate: Double
    let totalWorkHours: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "providerId"
        case name = "providerName"
        case commissionRate = "commissionRate"
        case sales = "sales"
        case standardCost = "standardCost"
        case tips = "tips"
        case cashCollected = "cashCollected"
        case commission = "commission"
        case taxableCashPaymentRate = "taxableCashPaymentRate"
        case totalWorkHours = "totalWorkHours"
    }
}
