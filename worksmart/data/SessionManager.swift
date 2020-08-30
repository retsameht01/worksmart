//
//  SessionManager.swift
//  worksmart
//
//  Created by Tin Le on 4/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation

class SessionManager: ObservableObject {
    @Published
    var gposApiToken: String = ""
    @Published
    var gposApiRefreshToken: String = ""
    @Published
    var currentUser: String = ""
    
}
