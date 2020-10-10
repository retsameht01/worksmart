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
    let standardCost: Double
    let price: Double
    let saleTaxGroupId: Int
    let saleTaxRate:Int
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
    
    static func getFormattedPrice(value: Double)-> String {
        return String(format:"$%.2f", value)
    }
    
    /*
     
     SubtotalBeforeTax = Quantity * UnitPrice;
     SaleTax = Math.Round(UnitPrice * Quantity * (SaleTaxRate / 100), 2, MidpointRounding.AwayFromZero);
     GrandTotal = SubtotalBeforeTax + SaleTax + Tip;
     */
    
    
    func getTaxAmount() -> Double {
        let total = price * Double(saleTaxRate / 100)
        return AppUtil.formatDouble(input: total)
    }
    
    func getUnitPrice(qty: Int) -> Double {
        let amt = Double(qty) * price
        return AppUtil.formatDouble(input: amt)
    }
    
    func getUnitPricePlusTax() -> Double {
        let amt =  getUnitPrice(qty: 1) + getTaxAmount()
        return AppUtil.formatDouble(input: amt)
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



