//
//  LoginForm.swift
//  worksmart
//
//  Created by Tin Le on 2/19/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct LoginForm: View {
    @ObservedObject var viewRouter: LoginRouter

    @State private var username = ""
    @State private var password = ""
    @ObservedObject var signInVm: SignInVM = SignInVM()
    
    var body: some View {
        VStack {
            Text(AppConstants.LOGIN_TITLE)
                .font(.largeTitle).foregroundColor(Color.white)
                .padding(.vertical, 40)
                .shadow(radius: 10.0, x: 20, y: 10)
            
            Image("iosapptemplate")
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10.0, x: 20, y: 10)
                .padding(.bottom, 50)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Username", text: self.$username)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(10.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .autocapitalization(.none)
                
                SecureField("Password", text: self.$password)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(10.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .autocapitalization(.none)
                
            }.padding(.horizontal, 27.5)
            
            Button(action: {
                self.signInVm.login(username: self.username, password: self.password, completion: { success in
                  print("Login success")
                  if (success) {
                      self.viewRouter.currentPage = "home"
                  }
                })
                
            }) {
                Text(AppConstants.SIGN_IN_LABEL)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 50)
            
            Spacer()
            HStack(spacing: 0) {
                Text("Don't have an account?")
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                
                Button(action: {
                    self.viewRouter.currentPage = "signUp"
                }) {
                    Text(AppConstants.SIGN_UP_LABEL).foregroundColor(.white)
                }
            }
        }
        .onAppear(perform: self.doInitialize)
        .background(LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all))
            
    }
    
    func doInitialize() {
        signInVm.initialize( completion: { success in
            print(" success")
            if (success) {
                self.viewRouter.currentPage = "home"
            }
          })
    }
}


struct LoginForm_Previews: PreviewProvider {
    @EnvironmentObject var profileManager: ProfileManager
    static var previews: some View {
        LoginForm(viewRouter: LoginRouter())
    }
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}
