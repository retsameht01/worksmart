//
//  APISession.swift
//  worksmart
//
//  Created by Tin Le on 9/7/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine

struct APISession: APIService {
    func request<T>(with request: URLRequest) -> AnyPublisher<T, APIError> where T: Decodable {
        
        // 1
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // 2
        return URLSession.shared
            .dataTaskPublisher(for: request)
            // 3
            .receive(on: DispatchQueue.main)
            // 4
            .mapError { _ in .unknown }
            // 5
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                    // 6
                    return Just(data)
                        .decode(type: T.self, decoder: decoder)
                        .mapError {_ in .decodingError}
                        .eraseToAnyPublisher()
                    } else {
                    // 7
                        return Fail(error: APIError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown)
                        .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
