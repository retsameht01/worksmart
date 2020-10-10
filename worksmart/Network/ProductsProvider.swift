//
//  ProductsProvider.swift
//  worksmart
//
//  Created by Tin Le on 9/7/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine

protocol ProductsProvider {
    var apiSession: APIService {get}
    func getProducts(token: String, storeId: String) -> AnyPublisher<[Category], APIError>
}

extension ProductsProvider {
    func getProducts(token: String, storeId: String) -> AnyPublisher<[Category], APIError> {
        let bearerToken = "Bearer \(token)"
        let url = String(format: ApiConstants.GPOS_API_BASE_API, storeId, "Categories")
        
        var request: URLRequest = URLRequest(url: URL(string: url)!)
        request.addValue(bearerToken, forHTTPHeaderField: "Authorization")
        
        return apiSession.request(with: request)
    }
}

