//
//  ProductsApiResponse.swift
//  worksmart
//
//  Created by Tin Le on 9/7/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation

struct ProductsApiResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Category]
}
