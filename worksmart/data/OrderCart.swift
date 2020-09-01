//
//  OrderCart.swift
//  worksmart
//
//  Created by Tin Le on 8/31/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
class OrderCart: ObservableObject {
    @Published var products: [Product] = []
    
    func getTotal() -> String {
        var total: Float = 0
        for product in products {
            total += product.price
        }
        return Product.getFormattedPrice(value: total)
    }
}
