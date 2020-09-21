//
//  APIService.swift
//  worksmart
//
//  Created by Tin Le on 9/7/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with: URLRequest) -> AnyPublisher<T, APIError>
}
/*
protocol RequestBuilder {
    var urlRequest: URLRequest {get}
}
 
 */

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
