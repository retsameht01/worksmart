//
//  CheckoutViewModel.swift
//  worksmart
//
//  Created by Tin Le on 9/13/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine

class CheckoutViewModel: CheckoutSerivce {
    var apiSession: APIService
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }

    func makePayment(billingInfo: UserInfo, creditCard: CreditCard, order: [Product], completion: @escaping (_ result: String) -> Void) {
        let merchantAuth = MerchantAuthentication(name: ApiConstants.AUTHORIZE_MERCHANT_ID, transactionKey: ApiConstants.AUTHORIZE_TRANS_KEY)
               let refId = "id1"
               let payment = Payment(creditCard: creditCard)
               let lineItems = LineItems(lineItem: LineItem(
                   itemID: "orderId",
                   name: "order name",
                   lineItemDescription: "order details",
                   quantity: "1",
                   unitPrice: "45.00"
               ))
               
               let tax = OtherCharge(
                   amount: "12", name: "tax", dutyDescription: "Sales Tax"
               )
               
               let transSettings = TransactionSettings(setting: Setting(settingName: "testRequest", settingValue: "false"))
               let userFields = UserFields(userField: [UserField(name: "test Field 1", value: "test value 1")])
               
               let transRequest: TransactionRequest = TransactionRequest(
                   transactionType: ApiConstants.AUTHORIZE_TRANS_TYPE,
                   amount: "55",
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
                   subsequentAuthInformation: SubsequentAuthInformation(originalNetworkTransID: "123456789NNNH", originalAuthAmount: "45.00", reason: "resubmission"),
                   authorizationIndicatorType: AuthorizationIndicatorType(authorizationIndicator: "final")
               )
               
               let createRequest = CreateTransactionRequest(merchantAuthentication: merchantAuth, refID: refId, transactionRequest: transRequest)
        
                
               submitPayment(paymentInfo: PaymentTransaction(createTransactionRequest: createRequest), completion: completion)
    }

    private func submitPayment(paymentInfo: PaymentTransaction, completion: @escaping (_ success: String) -> Void) {
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
                completion("RefId: \(response.refID), \nAuthCode: \(response.transactionResponse.authCode), Response Code: \(response.transactionResponse.responseCode)")
                
        }
        cancellables.insert(cancellable)
    }
}
