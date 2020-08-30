//
//  Category.swift
//  worksmart
//
//  Created by Tin Le on 8/29/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let active: Bool
    let displayOrder: Int
    let listProducts: [ListProduct]
    let modifiers: [Modifier]?
    
    enum CodingKeys: String, CodingKey, CaseIterable, Codable, Hashable {
        case id = "id"
        case name = "name"
        case active = "active"
        case displayOrder = "displayOrder"
        case listProducts = "listProducts"
        case modifiers = "modifiers"
    }
}

struct ListProduct: Codable, Identifiable {
    let id: Int
    let name: String
    let displayOrder: Int
    let imageUri: String
    let active: Bool
    let products: [Product]
    
    enum CodingKeys: String, CodingKey, CaseIterable, Codable, Hashable {
        case id = "id"
        case name = "name"
        case displayOrder = "displayOrder"
        case imageUri = "imageUri"
        case active = "active"
        case products = "products"
    }
}

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let active: Bool
    let sku: String
    let standardCost: Float
    let price: Float
    let saleTaxGroupId: Int
    let saleTaxRate:Float
    let imageUri: String
    let showOnApp: Bool
    let details: String?
    
    enum CodingKeys: String, CodingKey, CaseIterable, Codable, Hashable {
        case id = "id"
        case name = "name"
        case active = "active"
        case sku = "sku"
        case standardCost = "standardCost"
        case price = "price"
        case saleTaxGroupId = "saleTaxGroupId"
        case saleTaxRate = "saleTaxRate"
        case imageUri = "imageUri"
        case showOnApp = "showOnApp"
        case details = "details"
    }
    
    static func getFormattedPrice(value: Float)-> String {
        return String(format:"$%.2f", value)
    }
}

struct Modifier: Codable, Identifiable {
    let id: Int
    let note: String
    let price: Float
    let name: String
    
    enum CodingKeys: String, CodingKey, CaseIterable, Codable, Hashable {
        case id = "id"
        case note = "note"
        case price = "price"
        case name = "name"
    }
}



