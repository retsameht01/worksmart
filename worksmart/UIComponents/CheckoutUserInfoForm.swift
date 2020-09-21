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
    @Binding var address: String
    @Binding var city: String
    @Binding var zip: String
    @Binding var state: String
    
    var body: some View {
        VStack {
            
            
            Text("Account Holder Info")
                .padding(.bottom, 20).foregroundColor(.blue)
                .font(.headline)
            
            
            
            HStack {
                LabelTextField(label:"First Name", placeHolder:"", text: self.$firstName)
                LabelTextField(label:"Last Name", placeHolder:"", text: self.$lastName)
            }
            
            LabelTextField(label:"Email", placeHolder:"", text: self.$email)
            LabelTextField(label:"Phone", placeHolder:"", text: self.$phone)
            LabelTextField(label:"Address", placeHolder: "", text: self.$address)
            HStack {
                
                LabelTextField(label:"City", placeHolder: "", text: self.$city)
                LabelTextField(label:"State", placeHolder: "", text: self.$state)
                LabelTextField(label:"Zip", placeHolder: "", text: self.$zip)
            }
            Spacer()
        }
    }//End of View
}

struct CheckoutUserInfoForm_Previews: PreviewProvider {
    @State static var firstName = ""
    @State static var lastName = ""
    @State static var email = ""
    @State static var phone = ""
    @State static var address = ""
    @State static var city = ""
    @State static var zip = ""
    @State static var state = ""
    
    static var previews: some View {
        CheckoutUserInfoForm(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, address: $address, city: $city, zip: $zip, state: $state)
    }
}
