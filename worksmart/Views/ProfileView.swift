//
//  ProfileScreen.swift
//  worksmart
//
//  Created by Tin Le on 2/19/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewRouter: LoginRouter
    @ObservedObject var profileVM: ProfileVM
    @State private var showAppointments = false
    @State private var showRevenue = false
    @State private var showCustomerServed = false
    @State private var selectedProducts: [Product] = []
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Spacer()
                Button(action: {
                    self.viewRouter.currentPage = "login"
                }){
                    Text("Logout")
                        .padding(.horizontal, 20)
                        .foregroundColor(.blue)
                }
            }
            ProductListView(allProducts: profileVM.allProducts, selectedProducts: $selectedProducts)
            SelectedProductListView(products: $selectedProducts)
        }.onAppear(perform: {
            //self.profileVM.getWeather(city: "Atlanta")
            self.profileVM.getSampleProduct()
        })
        .padding(20)
        .background(
        LinearGradient(gradient: Gradient(colors: [CustomColor.cleanBlue, CustomColor.pastelCoral]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
    }
    
    func getTimeStamp() -> String{
        let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .short)
       return timestamp
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewRouter: LoginRouter(), profileVM: ProfileVM())
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
