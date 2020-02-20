//
//  LoginRouter.swift
//  worksmart
//
//  Created by Tin Le on 2/19/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class LoginRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<LoginRouter,Never>()
    var currentPage: String = "login" {
        didSet {
            objectWillChange.send(self)
        }
    }
}
