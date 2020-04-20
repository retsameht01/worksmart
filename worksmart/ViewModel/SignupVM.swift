//
//  SignupViewModel.swift
//  worksmart
//
//  Created by Tin Le on 4/13/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import SwiftyJSON

class SignupVM: ObservableObject {
    private let gposService = GposService()
    let didChange = PassthroughSubject<SignupVM, Never>()
    @Published
    private var registerStatus: String = "Registering..." {
        didSet {
            didChange.send(self)
        }
    }
    
    func register(firstName: String, lastName: String, username: String, password: String) {
        gposService.register(firstName: firstName, lastName: lastName, userName: username, password: password, completion: {_, result in
            self.registerStatus = result ?? ""
        })
    }
    

    
}
