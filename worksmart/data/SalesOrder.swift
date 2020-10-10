// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct SaleOrder: Codable {
    let id: Int
    let orderDate, lastUpdate, status: String
    let paid: Bool
    let orderNumber, terminalID: String
    let isMobile: Bool
    let tableName: String
    let tableID: Int
    let notes: String
    let customerID: Int
    let customerPhone, customerEmailAddress, customerFirstName, customerLastName: String
    let saleOrderItems: [SaleOrderItem]
    let payments: [Payment]
    let preAuth: String
    let subTotalBeforeTax, saleTax, grandTotal, tips: Double
    let cashback, paidAmount, balanceDue, discount: Double
    let createdBy, rated, ratedNotes: String
    let guestCount: Int
    let requestDeliveryTime, confirmedDeliveryTime: String

    enum CodingKeys: String, CodingKey {
        case id, orderDate, lastUpdate, status, paid, orderNumber
        case terminalID = "terminalId"
        case isMobile, tableName
        case tableID = "tableId"
        case notes
        case customerID = "customerId"
        case customerPhone, customerEmailAddress, customerFirstName, customerLastName, saleOrderItems, payments, preAuth, subTotalBeforeTax, saleTax, grandTotal, tips, cashback, paidAmount, balanceDue, discount, createdBy, rated, ratedNotes, guestCount, requestDeliveryTime, confirmedDeliveryTime
    }
}

// MARK: - Payment
struct Payment: Codable {
    let paymentID: Int
    let terminalIPAddress, terminalPort: String
    let orderID: Int
    let time, paymentType, paymentMethod, merchantID: String
    let terminalID, operatorID, userTrace, tranCode: String
    let serverCmdStatus, serverTextResponse, invoiceNo, ref: String
    let customerName: String
    let amount, gratuity, cashback, tender: Double
    let change: Double
    let cardType, authCode, acctNo, captureStatus: String
    let acqRefData, processData, recordNo, entryMethod: String
    let serverDate, serverTime, applicationLabel, printData: String
    let giftCardAccount: String

    enum CodingKeys: String, CodingKey {
        case paymentID = "paymentId"
        case terminalIPAddress, terminalPort
        case orderID = "orderId"
        case time, paymentType, paymentMethod
        case merchantID = "merchantId"
        case terminalID = "terminalId"
        case operatorID = "operatorId"
        case userTrace, tranCode, serverCmdStatus, serverTextResponse, invoiceNo, ref, customerName, amount, gratuity, cashback, tender, change, cardType, authCode, acctNo, captureStatus, acqRefData, processData, recordNo, entryMethod, serverDate, serverTime, applicationLabel, printData, giftCardAccount
    }
}

// MARK: - SaleOrderItem
struct SaleOrderItem: Codable {
    let id: Int?
    let createdOn: String
    let productID: Int
    let name: String?
    let providerID: Int?
    let providerName: String?
    let quantity:Int
    let saleTaxRate: Int
    let unitPrice, unitPriceBeforeDiscount: Double
    let discount, saleTax, tip, standardCost: Double
    let subTotalBeforeTax, grandTotal: Double
    let isGiftCard: Bool
    let notes, nameNotes: String
    let servicePrinted: Bool
    let printerName: String?
    let orderID: Int?
    let orderNumber, customField1, customField2, customField3: String
    let modifiers: [Modifier]

    enum CodingKeys: String, CodingKey {
        case id, createdOn
        case productID = "productId"
        case name
        case providerID = "providerId"
        case providerName, quantity, saleTaxRate, unitPrice, unitPriceBeforeDiscount, discount, saleTax, tip, standardCost, subTotalBeforeTax, grandTotal, isGiftCard, notes, nameNotes, servicePrinted, printerName
        case orderID = "orderId"
        case orderNumber, customField1, customField2, customField3, modifiers
    }
}

// MARK: - Duration
struct Duration: Codable {
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
