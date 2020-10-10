//
//  CheckoutViewModel.swift
//  worksmart
//
//  Created by Tin Le on 9/13/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class CheckoutViewModel: CheckoutSerivce, SalesOrderProvider {
    var apiSession: APIService
    var cancellables = Set<AnyCancellable>()
    let profileManager: ProfileManager = ProfileManager()
    var order: [Product] = []
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }

    func makePayment(storeId:String, billingInfo: UserInfo, creditCard: CreditCard, order: [Product], completion: @escaping (_ result: String) -> Void) {
        self.order = order
        let merchantAuth = MerchantAuthentication(name: ApiConstants.AUTHORIZE_MERCHANT_ID, transactionKey: ApiConstants.AUTHORIZE_TRANS_KEY)
               let refId = "id1"
               let payment = SalePayment(creditCard: creditCard)
               
                
               let lineItems = LineItems(lineItem: LineItem(
                itemID: "\(order[0].id)",
                name: AppUtil.truncateString(rawString: order[0].name, offset: 31),
                lineItemDescription: "Details:\(String(describing: order[0].details))",
                   quantity: "1",
                   unitPrice: "\(order[0].getUnitPrice(qty: 1))"
               ))
               
               let tax = OtherCharge(
                amount: "\(order[0].getTaxAmount())", name: "tax", dutyDescription: "Sales Tax"
               )
               
               let transSettings = TransactionSettings(setting: Setting(settingName: "testRequest", settingValue: "false"))
               let userFields = UserFields(userField: [UserField(name: "test Field 1", value: "test value 1")])
               
               let transRequest: TransactionRequest = TransactionRequest(
                   transactionType: ApiConstants.AUTHORIZE_TRANS_TYPE,
                   amount: "\(order[0].getUnitPricePlusTax())",
                   payment: payment,
                   lineItems: lineItems,
                   tax: tax,
                   duty: tax ,
                   shipping: tax,
                   poNumber: "po",
                   customer: Customer(id: "customerId"),
                   billTo: billingInfo,
                   shipTo: billingInfo,
                   customerIP: "",
                   transactionSettings: transSettings,
                   userFields: userFields,
                   processingOptions: ProcessingOptions(isSubsequentAuth: "true"),
                   subsequentAuthInformation: SubsequentAuthInformation(originalNetworkTransID: "123456789NNNH", originalAuthAmount: "\(order[0].getUnitPricePlusTax())", reason: "resubmission"),
                   authorizationIndicatorType: AuthorizationIndicatorType(authorizationIndicator: "final")
               )
               
               let createRequest = CreateTransactionRequest(merchantAuthentication: merchantAuth, refID: refId, transactionRequest: transRequest)
        
                
        submitPayment(storeId: storeId, paymentInfo: PaymentTransaction(createTransactionRequest: createRequest), completion: completion)
    }

    private func submitPayment(storeId:String, paymentInfo: PaymentTransaction, completion: @escaping (_ success: String) -> Void) {
        let cancellable = self.submitPayment(paymentInfo: paymentInfo)
            .sink(receiveCompletion: { result in
                switch result {
                    case .failure(let error):
                        print("Handle error: \(error)")
                    case .finished:
                        break
                }
                
            }) { (response) in
                debugPrint(response)
                self.submitSaleOrder(storeId: storeId, saleOrder: self.getSaleOrder(paymentInfo: paymentInfo, paymentResponse: response), completion: completion)
        }
        cancellables.insert(cancellable)
    }
    
    private func submitSaleOrder(storeId: String, saleOrder: SaleOrder, completion: @escaping (_ success: String) -> Void) {
        let token = profileManager.getTokens()[AppConstants.userToken] ?? ""
        let cancellable = self.submitSaleOrder(token: token, storeId: storeId, saleOrder: saleOrder)
        .sink(receiveCompletion: { result in
            switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
            }
            
        }) { (response) in
            print("Order submission success Order# " + response)
            
            completion("Order #: \(response)")
            
        }
        cancellables.insert(cancellable)
    }
    
    private func getSaleOrder(paymentInfo: PaymentTransaction, paymentResponse: PaymentResponse) -> SaleOrder {
        let testDate = DateUtil.getCurrentUTCDateString()//"2020-09-27T13:34:21.951Z"
        let userInfo = paymentInfo.createTransactionRequest.transactionRequest.billTo
        let product = order[0]
        let saleOrderItem = SaleOrderItem(id: 1,
                                          createdOn: DateUtil.getCurrentUTCDateString(),
                                          productID: product.id,
                                          name: product.name,
                                          providerID: 0,
                                          providerName: "Smart Orders",
                                          quantity: 1,
                                          saleTaxRate: product.saleTaxRate,
                                          unitPrice: product.getUnitPrice(qty: 1),
                                          unitPriceBeforeDiscount: product.getUnitPrice(qty: 1),
                                          discount: 0,
                                          saleTax: product.getTaxAmount(),
                                          tip: 0,
                                          standardCost: product.standardCost,
                                          subTotalBeforeTax: product.getUnitPrice(qty: 1),
                                          grandTotal: product.getUnitPricePlusTax(),
                                          isGiftCard: false,
                                          notes: "no notes",
                                          nameNotes: "no notes",
                                          servicePrinted: true,
                                          printerName: "NA",
                                          orderID: 0,
                                          orderNumber: "NA",
                                          customField1: "",
                                          customField2: "",
                                          customField3: "",
                                          modifiers: [])
        
        
        
        let saleOrder = SaleOrder(id: 1,
                                  orderDate: testDate,
                                  lastUpdate: testDate,
                                  status: "Pending",
                                  paid: false,
                                  orderNumber: "",
                                  terminalID: "",
                                  isMobile: true,
                                  tableName: "",
                                  tableID: 0,
                                  notes: "",
                                  customerID: 0,
                                  customerPhone: "7705391185" ,
                                  customerEmailAddress: "tl8317@gmail.com",
                                  customerFirstName: "Tin",
                                  customerLastName: "Le",
                                  saleOrderItems: [saleOrderItem],
                                  payments: [],
                                  preAuth: paymentResponse.transactionResponse.authCode,
                                  subTotalBeforeTax: product.getUnitPrice(qty: 1),
                                  saleTax: product.getTaxAmount(),
                                  grandTotal: product.getUnitPricePlusTax(),
                                  tips: 0,
                                  cashback: 0,
                                  paidAmount: 0,
                                  balanceDue: product.getUnitPricePlusTax(),
                                  discount: 0,
                                  createdBy: "Smart Orders Mobile App",
                                  rated: "",
                                  ratedNotes: "",
                                  guestCount: 0,
                                  requestDeliveryTime: testDate,
                                  confirmedDeliveryTime: testDate)
        return saleOrder;
    }
    
    func buildPaymentData(paymentResponse: PaymentResponse) -> Payment {
        let testDate = DateUtil.getCurrentUTCDateString() //"2020-09-27T13:34:21.951Z"
        let payment = Payment(paymentID: 1,
        terminalIPAddress: "",
        terminalPort: "",
        orderID: 1,
        time: testDate,
        paymentType: "Card",
        paymentMethod: "VISA",
        merchantID: "merchant1",
        terminalID: "NA",
        operatorID: "NA",
        userTrace: "NA",
        tranCode: "NA",
        serverCmdStatus: "NA",
        serverTextResponse: "NA",
        invoiceNo: "1",
        ref: "1",
        customerName: "Test user",
        amount: 15,
        gratuity: 0,
        cashback: 0,
        tender: 0,
        change: 0,
        cardType: "VISA",
        authCode: paymentResponse.transactionResponse.authCode,
        acctNo: paymentResponse.transactionResponse.accountNumber,
        captureStatus: paymentResponse.transactionResponse.cavvResultCode,
        acqRefData: paymentResponse.transactionResponse.cavvResultCode,
        processData: paymentResponse.transactionResponse.cavvResultCode,
        recordNo: paymentResponse.transactionResponse.avsResultCode,
        entryMethod: "ASM",
        serverDate: paymentResponse.transactionResponse.messages[0].messageDescription,
        serverTime: "0000",
        applicationLabel: "Smart Orders",
        printData: "NA",
        giftCardAccount: "NA")
        return payment
    }
}
