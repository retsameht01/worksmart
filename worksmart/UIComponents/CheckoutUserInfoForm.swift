//
//  CheckoutUserInfoForm.swift
//  worksmart
//
//  Created by Tin Le on 8/31/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct CheckoutUserInfoForm: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var phone: String
    
    var body: some View {
        VStack {
            Text("Account Holder Info")
                .padding(.bottom, 20).foregroundColor(.blue)
                .font(.headline)
            HStack{
                LabelTextField(label:"First Name", placeHolder:"", text: self.$firstName)
                LabelTextField(label:"Last Name", placeHolder:"", text: self.$lastName)
            }
            
            LabelTextField(label:"Email", placeHolder:"", text: self.$email)
            LabelTextField(label:"Phone", placeHolder:"", text: self.$phone)
            Spacer()
        }
    }//End of View
}

struct CheckoutUserInfoForm_Previews: PreviewProvider {
    @State static var firstName = ""
    @State static var lastName = ""
    @State static var email = ""
    @State static var phone = ""
    
    static var previews: some View {
        CheckoutUserInfoForm(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone)
    }
}
