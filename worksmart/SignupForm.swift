//
//  SignupForm.swift
//  worksmart
//
//  Created by Tin Le on 2/19/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct SignupForm: View {
    @ObservedObject var viewRouter: LoginRouter
    var body: some View {
        VStack{
            Text("Sign me up")
            
            Button(action: {
                self.viewRouter.currentPage = "login"
            }) {
                Text("Cancel")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 50)
            
        }
    }
}

struct SignupForm_Previews: PreviewProvider {
    static var previews: some View {
        SignupForm(viewRouter: LoginRouter())
    }
}
