//
//  PaymentResponse.swift
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

// MARK: - Welcome
struct PaymentResponse: Codable {
    let transactionResponse: TransactionResponse
    let refID: String
    let messages: Messages

    enum CodingKeys: String, CodingKey {
        case transactionResponse
        case refID = "refId"
        case messages
    }
}

// MARK: - Messages
struct Messages: Codable {
    let resultCode: String
    let message: [MessagesMessage]
}

// MARK: - MessagesMessage
struct MessagesMessage: Codable {
    let code, text: String
}

// MARK: - TransactionResponse
struct TransactionResponse: Codable {
    let responseCode, authCode, avsResultCode, cvvResultCode: String
    let cavvResultCode, transID, refTransID, transHash: String
    let testRequest, accountNumber, accountType: String
    let messages: [TransactionResponseMessage]
    let userFields: [UserField]
    let transHashSha2: String
    let supplementalDataQualificationIndicator: Int
    let networkTransID: String

    enum CodingKeys: String, CodingKey {
        case responseCode, authCode, avsResultCode, cvvResultCode, cavvResultCode
        case transID = "transId"
        case refTransID, transHash, testRequest, accountNumber, accountType, messages, userFields, transHashSha2
        case supplementalDataQualificationIndicator = "SupplementalDataQualificationIndicator"
        case networkTransID = "networkTransId"
    }
}

// MARK: - TransactionResponseMessage
struct TransactionResponseMessage: Codable {
    let code, messageDescription: String

    enum CodingKeys: String, CodingKey {
        case code
        case messageDescription = "description"
    }
}
