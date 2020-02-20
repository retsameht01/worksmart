//
//  LoginScreen.swift
//  worksmart
//
//  Created by Tin Le on 2/19/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    @ObservedObject var loginRouter: LoginRouter
    
    var body: some View {
        VStack {
            if loginRouter.currentPage == "login" {
                LoginForm(viewRouter: loginRouter)
            }
            else if loginRouter.currentPage == "signUp" {
                SignupForm(viewRouter: loginRouter)
            }
            else {
                ContentView()
            }
        }
    }
}
struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(loginRouter: LoginRouter())
    }
}




