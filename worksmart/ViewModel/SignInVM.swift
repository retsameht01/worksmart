//
//  SignInVM.swift
//  worksmart
//
//  Created by Tin Le on 4/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import SwiftyJSON

class SignInVM: ObservableObject {
    private let gposService = GposService()
    let didChange = PassthroughSubject<SignInVM, Never>()
    
    @Published
    private var signInStatus: String = "Logging in..." {
        didSet {
            didChange.send(self)
        }
    }
    
    func login(username: String, password: String) {
        gposService.login(userName: username, password: password) { (isSuccess, profile) in
            print("login success? \(isSuccess)")
            
            guard let validProfile = profile else {
                self.signInStatus = "Failed"
                return
            }
            
            print("first name: \(validProfile.firstName) \(validProfile.lastName) token: \(validProfile.token)")
            self.signInStatus = "success"
        }
    }
    
    
}
