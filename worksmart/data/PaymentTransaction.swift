//
//  PaymentTransaction.swift
//  worksmart
//
//  Created by Tin Le on 9/13/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

//MARK: - CreateTransactionRequest Wrapper

struct PaymentTransaction: Codable {
    let createTransactionRequest: CreateTransactionRequest
    
    enum CodingKeys: String, CodingKey {
        case createTransactionRequest
    }
}

extension PaymentTransaction {
    func toJson() -> String {
        return AppUtil.toJson(kvp:[
            "createTransactionRequest": self.createTransactionRequest.toJson()
        ])
    }
}

// MARK: - CreateTransactionRequest
struct CreateTransactionRequest: Codable {
    let merchantAuthentication: MerchantAuthentication
    let refID: String
    let transactionRequest: TransactionRequest

    enum CodingKeys: String, CodingKey {
        case merchantAuthentication
        case refID = "refId"
        case transactionRequest
    }
}

extension CreateTransactionRequest {
    func toJson() -> String {
        return AppUtil.toJson(kvp: [
            "merchantAuthentication": self.merchantAuthentication.toJson(),
            "refId": self.refID,
            "transactionRequest": self.transactionRequest.toJson()
        ])
    }
    
}

// MARK: - MerchantAuthentication
struct MerchantAuthentication: Codable {
    let name, transactionKey: String
}

extension MerchantAuthentication {
    
    func toJson() -> String {
        return AppUtil.toJson(kvp:[
            "name": self.name,
            "transactionKey": self.transactionKey
        ])
    }
}

// MARK: - TransactionRequest
struct TransactionRequest: Codable {
    let transactionType, amount: String
    let payment: Payment
    let lineItems: LineItems
    let tax, duty, shipping: OtherCharge
    let poNumber: String
    let customer: Customer
    let billTo, shipTo: UserInfo
    let customerIP: String
    let transactionSettings: TransactionSettings
    let userFields: UserFields
    let processingOptions: ProcessingOptions
    let subsequentAuthInformation: SubsequentAuthInformation
    let authorizationIndicatorType: AuthorizationIndicatorType
}

extension TransactionRequest {
    func toJson() -> String {
        return AppUtil.toJson(kvp: [
            "transactionType" : self.transactionType,
            "amount" : self.amount,
            "payment": self.payment.toJson(),
            "lineItems": self.lineItems.toJson(),
            "tax": self.tax.toJson(),
            "duty": self.duty.toJson(),
            "shipping": self.shipping.toJson(),
            "poNumber": self.poNumber,
            "customer": self.customer.toJson(),
            "billTo": self.billTo.toJson(),
            "shipTo": self.shipTo.toJson(),
            "customerIP": self.customerIP,
            "transactionSettings": self.transactionSettings.toJson(),
            "userFields": self.userFields.toJson(),
            "processingOptions": self.processingOptions.toJson(),
            "subsequentAuthInformation": self.subsequentAuthInformation.toJson(),
            "authorizationIndicatorType": self.authorizationIndicatorType.toJson()
        ])
        
    }
}

// MARK: - AuthorizationIndicatorType
struct AuthorizationIndicatorType: Codable {
    let authorizationIndicator: String
}

extension AuthorizationIndicatorType {
    func toJson() -> String {
        return AppUtil.toJson(kvp: [
            "authorizationIndicator": self.authorizationIndicator
        ])
    }
}

// MARK: - To
struct UserInfo: Codable {
    let firstName, lastName, company, address: String
    let city, state, zip, country: String
}

extension UserInfo {
    func toJson() -> String {
        return AppUtil.toJson(kvp: [
            "firstName" : self.firstName,
            "lastName" : self.lastName,
            "company" : self.company,
            "address" : self.address,
            "city" : self.city,
            "state" : self.state,
            "zip" : self.zip,
            "country" : self.country
        ])
    }
}

// MARK: - Customer
struct Customer: Codable {
    let id: String
}
extension Customer {
    func toJson() -> String {
        return AppUtil.toJson(kvp: [
            "id": self.id
        ])
    }
}

// MARK: - Duty
struct OtherCharge: Codable {
    let amount, name, dutyDescription: String

    enum CodingKeys: String, CodingKey {
        case amount, name
        case dutyDescription = "description"
    }
}

extension OtherCharge {
    func toJson() -> String {
        return AppUtil.toJson(kvp: [
            "amount" : self.amount,
            "name": self.name,
            "description": self.dutyDescription
        ] )
    }
}

// MARK: - LineItems
struct LineItems: Codable {
    let lineItem: LineItem
}

extension LineItems {
    func toJson() -> String {
        return AppUtil.toJson(kvp: [
            "lineItem": self.lineItem.toJson()
        ])
    }
}

// MARK: - LineItem
struct LineItem: Codable {
    let itemID, name, lineItemDescription, quantity: String
    let unitPrice: String

    enum CodingKeys: String, CodingKey {
        case itemID = "itemId"
        case name
        case lineItemDescription = "description"
        case quantity, unitPrice
    }
}

extension LineItem {
    func toJson() -> String {
        return AppUtil.toJson(kvp:[
            "itemId": self.itemID,
            "name" : self.name,
            "description": self.lineItemDescription,
            "quantity" : self.quantity,
            "unitPrice": self.unitPrice
        ])
    }
}

// MARK: - Payment
struct Payment: Codable {
    let creditCard: CreditCard
}

extension Payment {
    func toJson() -> String {
        
        return AppUtil.toJson(kvp:[
            "creditCard" : creditCard.toJson()
        ])
    }
}

// MARK: - CreditCard
struct CreditCard: Codable {
    let cardNumber, expirationDate, cardCode: String
}

extension CreditCard {
    func toJson() -> String {
        return AppUtil.toJson(kvp:[
            "cardNumber" : self.cardNumber,
            "expirationDate": self.expirationDate,
            "cardCode": self.cardCode
        ])
    }
}

// MARK: - ProcessingOptions
struct ProcessingOptions: Codable {
    let isSubsequentAuth: String
}

extension ProcessingOptions {
    
    func toJson() -> String {
        return AppUtil.toJson(kvp: [
            "isSubsequentAuth" : self.isSubsequentAuth
        ])
    }
}

// MARK: - SubsequentAuthInformation
struct SubsequentAuthInformation: Codable {
    let originalNetworkTransID, originalAuthAmount, reason: String

    enum CodingKeys: String, CodingKey {
        case originalNetworkTransID = "originalNetworkTransId"
        case originalAuthAmount, reason
    }
}

extension SubsequentAuthInformation {
    func toJson() -> String {
        return AppUtil.toJson(kvp:[
            "originalNetworkTransId": self.originalNetworkTransID,
            "originalAuthAmount": self.originalAuthAmount,
            "reason": self.reason
        ])
    }
}

// MARK: - TransactionSettings
struct TransactionSettings: Codable {
    let setting: Setting
}

extension TransactionSettings {
    func toJson() -> String {
        
        return AppUtil.toJson(kvp: [
            "setting" : self.setting.toJson()
        ])
    }
}

// MARK: - Setting
struct Setting: Codable {
    let settingName, settingValue: String
}

extension Setting {
    func toJson() -> String {
        return AppUtil.toJson(kvp: [
            "settingName" : self.settingName,
            "settingValue": self.settingValue
        ])
    }
}

// MARK: - UserFields
struct UserFields: Codable {
    let userField: [UserField]
}

extension UserFields {
    func toJson() -> String {
        
        return AppUtil.toJson(kvp:  [
            "userField" : self.userField[0].toJson()
        ])
        
    }
}

// MARK: - UserField
struct UserField: Codable {
    let name, value: String
}

extension  UserField {
    func toJson() -> String {
        
        AppUtil.toJson(kvp:  [
            "name": self.name,
            "value": self.value
        ])
    }
}

