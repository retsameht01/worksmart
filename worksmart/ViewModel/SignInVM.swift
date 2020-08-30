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
    let profileManager: ProfileManager = ProfileManager()
    private let gposService = GposService()
    private var password: String = ""
    let didChange = PassthroughSubject<SignInVM, Never>()
    //(String) -> ()
    private var loginCompletion:(_ boolean: Bool) -> () = {success in }
    
    @Published
    var signInStatus: String = "Logging in..." {
        didSet {
            didChange.send(self)
        }
    }
    
    lazy var loginCompletionHandler: (Bool, AccountProfile?) -> Void = { (isSuccess, profile ) in
        print("login success? \(isSuccess)")
        
        guard let validProfile = profile else {
            self.signInStatus = "Failed"
            self.loginCompletion(false)
            return
        }
        
        self.profileManager.saveProfile(profile: validProfile, password: self.password)
        self.signInStatus = "completed"
        self.loginCompletion(true)
    }
    
    func login(username: String, password: String, completion: @escaping (_ boolean: Bool) -> Void) {
        self.password = password
        loginCompletion = completion
        gposService.login(userName: username, password: password, completion: loginCompletionHandler)
    }
    
    func initialize(completion: @escaping (_ boolean: Bool) -> Void) {
        let tokenInfo = [String : String]() //profileManager.getTokens()
        let loginInfo = [String : String]()// profileManager.getSavedLogin()
        print("login creds \(loginInfo)")
        print("token \(tokenInfo)")
        guard let token = tokenInfo[AppConstants.userToken] else {
            let username = loginInfo[AppConstants.userNameKeychainKey]
            let password = loginInfo[AppConstants.userPasswordKeychainKey]
            if (username != nil && password != nil) {
                gposService.login(userName: username!, password: password!, completion: loginCompletionHandler)
            }
            completion(false)
            return
        }
        
        signInStatus = "completed"
        
        print("token \(token)")
        completion(true)
    }
}
