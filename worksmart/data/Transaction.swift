//
//  Transaction.swift
//  worksmart
//
//  Created by Tin Le on 3/16/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation

struct Transaction : Hashable {
    var id: Int
    var customerName: String
    var total: String
    var paymentType: String
    var services: [String]
    var time: String
}
