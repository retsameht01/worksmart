//
//  SalesOrderProvider.swift
//  worksmart
//
//  Created by Tin Le on 9/27/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine

protocol SalesOrderProvider {
    var SALES_ORDER_PATH:String {get}
    var apiSession: APIService {get}
    func submitSaleOrder(token: String, storeId: String, saleOrder: SaleOrder) -> AnyPublisher<String, APIError>
}

extension SalesOrderProvider {
    func submitSaleOrder(token: String, storeId: String, saleOrder: SaleOrder) -> AnyPublisher<String, APIError> {
        
        let bearerToken = "Bearer \(token)"
        let url = String(format: ApiConstants.GPOS_API_BASE_API, storeId, self.SALES_ORDER_PATH)
        
        var request: URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.addValue(bearerToken, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try  encoder.encode(saleOrder)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("************* Sale Order Json **************")
                print(jsonString)
            }
            request.httpBody = jsonData //try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        return apiSession.request(with: request)
        
    }
    
    var SALES_ORDER_PATH: String {
        get {
            return "SaleOrders"
        }
    }
}


