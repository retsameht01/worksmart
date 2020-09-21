//
//  ProfileScreen.swift
//  worksmart
//
//  Created by Tin Le on 2/19/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileVM: ProfileVM = ProfileVM()
    @EnvironmentObject var checkoutCart: OrderCart
    @EnvironmentObject var settingsManager: SettingsManager
    @ObservedObject var viewRouter: LoginRouter
    @Binding var currentTabSelection: Int
    @State private var showAppointments = false
    @State private var showRevenue = false
    @State private var showCustomerServed = false
    @State private var selectedProducts: [Product] = []
    
    
    var body: some View {
        VStack(alignment:.center){
            HStack{
                Spacer()
                Text("\(settingsManager.businessName)")
                Button(action: {
                    self.viewRouter.currentPage = "login"
                }){
                    Text("Logout")
                        .padding(.horizontal, 20)
                        .foregroundColor(.blue)
                }
            }
            ProductListView(allProducts: profileVM.allProducts, selectedProducts: $selectedProducts)
            Spacer()
            SelectedProductListView(products: $selectedProducts)
            Button(action: {
                self.doCheckout()
            }){
                Text("Checkout")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.green)
                .cornerRadius(5.0)
            }
            
        }.onAppear(perform: {
            self.profileVM.loadProducts(storeId: self.settingsManager.businessId)
        })
        .padding(20)
        .background(
        LinearGradient(gradient: Gradient(colors: [CustomColor.cleanBlue, CustomColor.pastelCoral]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
    }
    
    private func doCheckout() {
        self.checkoutCart.products = selectedProducts
        self.currentTabSelection = 1
    }
    
    func getTimeStamp() -> String{
        let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .short)
       return timestamp
    }
}

struct ProfileView_Previews: PreviewProvider {
    @State private static var selection = 0
    static var previews: some View {
        ProfileView(viewRouter: LoginRouter() , currentTabSelection: $selection)
    }
}



/*
 to show alert
 
 .alert(isPresented: $showAppointments) {
 Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
 
 To show Modal
 .sheet(isPresented: self.$show_modal) {
  ModalView()
 }
 */
