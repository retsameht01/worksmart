//
//  CreditCardInfoForm.swift
//  worksmart
//
//  Created by Tin Le on 8/31/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct CreditCardInfoForm: View {
    @Binding var cardNumber: String
    @Binding var cvv: String
    @Binding var expYear: String
    @Binding var expMonth: String
    
    var body: some View {
        VStack{
            Text("Credit Card Info")
            LabelTextField(label:"Card #", placeHolder:"", text: self.$cardNumber)
            LabelTextField(label:"CVV", placeHolder:"", text: self.$cvv)
            HStack {
                LabelTextField(label:"Exp Month", placeHolder:"", text: self.$expMonth)
                LabelTextField(label:"Exp Year", placeHolder:"", text: self.$expYear)
            }
            
        }
    }//End of View
}

struct CreditCardInfoForm_Previews: PreviewProvider {
    @State static var cardNumber: String = ""
    @State static var cvv: String = ""
    @State static var expYear: String = ""
    @State static var expMonth: String = ""
    
    static var previews: some View {
        CreditCardInfoForm(cardNumber: $cardNumber, cvv: $cvv, expYear: $expYear, expMonth: $expMonth)
    }
}
