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
    @State var isLoading: Bool = false
    @ObservedObject var signupVm = SignupVM()
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var business: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(spacing:20){
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
                .padding(.bottom, 20)
            //Form fields
            LabelTextField(label:"First Name", placeHolder:"Jimmy", text: self.$firstName)
            LabelTextField(label:"Last Name", placeHolder:"John", text: self.$lastName)
            LabelTextField(label:"Email", placeHolder:"Your email", text: self.$email)
            LabelTextField(label:"Password", placeHolder:"Your password", text: self.$password)
            LabelTextField(label:"Phone", placeHolder:"Your phone", text: self.$phone)
            LabelTextField(label:"Business Name", placeHolder:"Your work place", text: self.$business)
            
            Button(action: {
                self.submit()
            }) {
                Text("Submit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(10.0)
            }.padding(.top, 10)
        }//End of VStack
    }
    
    func submit() {
        print("do sign up submission!!!")
        
        signupVm.register(firstName: self.firstName,
                          lastName: self.lastName,
                          username: self.email,
                          password: self.password)
    }
}

struct SignupForm_Previews: PreviewProvider {
    static var previews: some View {
        SignupForm(viewRouter: LoginRouter())
    }
}
