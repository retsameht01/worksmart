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
        VStack(spacing:30){
            HStack{
                Button(action: {
                    self.viewRouter.currentPage = "login"
                }){
                    Text("Cancel")
                        .padding(.horizontal, 20)
                    .background(Color.green)
                    .foregroundColor(.white)
                }
                Spacer()
            }
            
            Text("Sign up")
                .font(.title)
                .foregroundColor(.green)
                .padding(.bottom, 60)
            //Form fields
            LabelTextField(label:"Name", placeHolder:"First & Last Name")
            LabelTextField(label:"Email", placeHolder:"Your email")
            LabelTextField(label:"Phone", placeHolder:"Your phone")
            LabelTextField(label:"Salon", placeHolder:"Your work place")
            
            Button(action: {
                self.submit()
            }) {
                Text("Submit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(10.0)
            }.padding(.top, 50)
        }
    }
    
    func submit() {
        print("do sign up submission!!!")
    }
}

struct SignupForm_Previews: PreviewProvider {
    static var previews: some View {
        SignupForm(viewRouter: LoginRouter())
    }
}
