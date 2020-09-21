//
//  CheckoutService.swift
//  worksmart
//
//  Created by Tin Le on 9/13/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine
import SwiftyJSON

protocol CheckoutSerivce {
    var apiSession: APIService {get}
    func submitPayment(paymentInfo: PaymentTransaction) -> AnyPublisher<PaymentResponse, APIError>
}


extension CheckoutSerivce {
    
    func submitPayment(paymentInfo: PaymentTransaction) -> AnyPublisher<PaymentResponse, APIError> {
        let url = String(format: ApiConstants.AUTHORIZE_TEST_API)
        var request: URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        //let encoder = JSONEncoder()
        var jsonString = paymentInfo.toJson()
        jsonString = jsonString.replacingOccurrences(of: "\"{", with: "{")
        jsonString = jsonString.replacingOccurrences(of: "}\"", with: "}")
        
        do {
            let jsonData = jsonString.data(using: .utf8)!
            //let jsonData = try encoder.encode(paymentInfo)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
            request.httpBody = jsonData //try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
            
        } catch let error {
            print(error.localizedDescription)
        }
        //request.httpBody = paymentInfo
        return apiSession.request(with: request)
    }
}
