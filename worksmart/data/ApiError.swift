//
//  ApiError.swift
//  worksmart
//
//  Created by Tin Le on 2/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
enum ApiError: Error {
    case parsing(description: String)
    case network(description: String)
}
