//
//  CheckoutView.swift
//  worksmart
//
//  Created by Tin Le on 8/31/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var checkoutCart: OrderCart
    @State var checkoutPage = "userInfo"
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var business: String = ""
    @State var password: String = ""
    //Credit card data
    @State var cardNumber: String = ""
    @State var cvv: String = ""
    @State var expYear: String = ""
    @State var expMonth: String = ""
    
    var order: [Product] = []
    var body: some View {
        VStack(spacing: 10){
            Text("Checkout")
            .font(.title)
            .foregroundColor(.green)
            .padding(.bottom, 10)
            
            if (checkoutPage == "userInfo") {
                CheckoutUserInfoForm(
                firstName: $firstName,
                lastName: $lastName,
                email: $lastName,
                phone: $phone)
                Button(action: {
                    self.goToCardInfo()
                }){
                    Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .cornerRadius(5.0)
                }
            } else if (checkoutPage == "creditInfo") {
                HStack{
                    Button(action: {
                        self.checkoutPage = "userInfo"
                    }){
                        Text("Back")
                    }
                    Spacer()
                }
                CreditCardInfoForm(cardNumber: $cardNumber,
                                   cvv: $cvv,
                                   expYear: $expYear,
                                   expMonth: $expMonth)
                Button(action: {
                    self.submitOrder()
                }){
                    Text("Submit Order")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .cornerRadius(5.0)
                }
            }
            else if (checkoutPage == "orderDetails") {
                OrderDetailsView(checkoutPage: $checkoutPage)
            }
            
            if (checkoutPage != "orderDetails") {
                HStack{
                    Text("Order total: \(checkoutCart.getTotal())")
                    Button(action:{
                        self.showOrderDetails()
                    }){
                        Text("details >")
                    }
                }.padding(.top, 20)
                    .padding(.bottom, 20)
            }
            Spacer()
        }
        
    }//End of View
    func showOrderDetails() {
        self.checkoutPage = "orderDetails"
    }
    
    func goToCardInfo() {
        self.checkoutPage = "creditInfo"
    }
    
    func submitOrder() {
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
