//
//  ProfileManager.swift
//  worksmart
//
//  Created by Tin Le on 4/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import SwiftUI

class ProfileManager : ObservableObject {
    
    func saveLogin(userName: String, password: String) {
        KeychainWrapper.standard.set(userName, forKey: AppConstants.userNameKeychainKey)
        KeychainWrapper.standard.set(password, forKey: AppConstants.userPasswordKeychainKey)
    }
    
    func getSavedLogin() -> [String : String] {
        var result = [String : String]()
        result[AppConstants.userNameKeychainKey] = KeychainWrapper.standard.string(forKey: AppConstants.userNameKeychainKey)
        result[AppConstants.userPasswordKeychainKey] = KeychainWrapper.standard.string(forKey: AppConstants.userPasswordKeychainKey)
        return result
    }
    
    func saveTokens(token: String, refreshToken: String) {
        KeychainWrapper.standard.set(token, forKey: AppConstants.userToken)
        KeychainWrapper.standard.set(refreshToken, forKey: AppConstants.refreshToken)
    }
    
    func getTokens() -> [String : String] {
        var result = [String : String]()
        result[AppConstants.userToken] = KeychainWrapper.standard.string(forKey: AppConstants.userToken)
        result[AppConstants.refreshToken] = KeychainWrapper.standard.string(forKey: AppConstants.refreshToken)
        return result
    }
    
    func saveProfile(profile: AccountProfile, password: String) {
        saveLogin(userName: profile.username, password: password)
        saveTokens(token: profile.token, refreshToken: profile.refreshToken)
    }
}
