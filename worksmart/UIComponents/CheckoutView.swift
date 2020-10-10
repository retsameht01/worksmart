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
    @EnvironmentObject var settingsMgr: SettingsManager
    @Binding var currentTabSelection: Int
    
    var checkoutVM: CheckoutViewModel = CheckoutViewModel()
    @State var checkoutSubView = "userInfo"
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var business: String = ""
    @State var password: String = ""
    @State var address: String = ""
    @State var city: String = ""
    @State var zip: String = ""
    @State var state: String = ""
    //Credit card data
    @State var cardNumber: String = ""
    @State var cvv: String = ""
    @State var expYear: String = ""
    @State var expMonth: String = ""
    
    @State var orderPaymentResult: String = ""
    
    var order: [Product] = []
    var body: some View {
        VStack(spacing: 10){
            Text("Checkout")
            .font(.title)
            .foregroundColor(.green)
            .padding(.bottom, 10)
            
            if (checkoutSubView != "orderDetails") {
                Button(action: {
                    self.doAutofill()
                }){
                    Text("Autofill")
                    .font(.headline)
                    .foregroundColor(.blue)
                }
            }
            
            if (checkoutSubView == "userInfo") {
                CheckoutUserInfoForm(
                firstName: $firstName,
                lastName: $lastName,
                email: $email,
                phone: $phone,
                address: $address,
                city: $city,
                zip: $zip,
                state: $state
                )
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
            } else if (checkoutSubView == "creditInfo") {
                HStack{
                    Button(action: {
                        self.checkoutSubView = "userInfo"
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
            else if (checkoutSubView == "orderDetails") {
                OrderDetailsView(checkoutPage: $checkoutSubView)
            } else if (checkoutSubView == "orderComplete") {
                OrderComplete(orderPaymentResult: self.orderPaymentResult, checkoutCurrentView: $checkoutSubView)
            }
            
            if (checkoutSubView != "orderDetails") {
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
        self.checkoutSubView = "orderDetails"
    }
    
    func goToCardInfo() {
        self.checkoutSubView = "creditInfo"
    }
    
    func doAutofill() {
        self.firstName = "Peter"
        self.lastName = "Smith"
        self.email = "test@email.com"
        self.phone = "7703456789"
        self.address = "123 5th Avenue"
        self.city = "Atlanta"
        self.state = "GA"
        self.zip = "30093"
        self.cardNumber = "5424000000000015"
        self.cvv = "999"
        self.expYear = "2022"
        self.expMonth = "01"
    }
    
    func submitOrder() {
        let userInfo = UserInfo(firstName: self.firstName,
                                lastName: self.lastName,
                                company: "",
                                address: self.address,
                                city: self.city,
                                state: self.state,
                                zip: self.zip,
                                country: AppConstants.DEFAULT_COUNTRY_CODE)
        
        let expirationDate = self.expYear + "-" + self.expMonth
        
        let creditCardInfo = CreditCard(cardNumber: self.cardNumber, expirationDate: expirationDate , cardCode: self.cvv)
        checkoutVM.makePayment(storeId: self.settingsMgr.businessId, billingInfo: userInfo,
                               creditCard: creditCardInfo,
                               order: checkoutCart.products) { result in
                                
                                self.orderPaymentResult = result
                                self.checkoutSubView = "orderComplete"
                                
                        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    @State static var blah = 1
    static var previews: some View {
        CheckoutView(currentTabSelection: $blah)
    }
}
