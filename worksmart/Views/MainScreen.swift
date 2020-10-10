//
//
//
//  Created by Tin Le on 2/18/20.
//  Copyright © 2020 Tin Le. All rights reserved.
// MainScreen -- the main container view for the app.

import SwiftUI

struct MainScreen: View {
    @State private var selection = 0
    @ObservedObject var viewRouter: LoginRouter
    var body: some View {
        TabView(selection: $selection){
            ProfileView(viewRouter: viewRouter, currentTabSelection: $selection)
                .tabItem { TapItem(imageName: "shopping_tab_icon", label: AppConstants.ORDER_TAB_LABEL) }
                .tag(0)
            
            CheckoutView(currentTabSelection: $selection)
                .tabItem { TapItem(imageName: "payment_tab_icon", label: AppConstants.CHECKOUT_TAB_LABEL) }
                .tag(1)
            
            /*
             TODO replace these with more meaniningful tabs (order history perhaps)
            ReportsView()
            .tabItem { TapItem(imageName: "reports", label: "Reports") }
            .tag(2)
            
            NotificationsView()
            .tabItem { TapItem(imageName: "notifications", label: "Notifications") }
            .tag(3)
             */
            
        }.background(
        LinearGradient(gradient: Gradient(colors: [CustomColor.cleanBlue, CustomColor.pastelCoral]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(viewRouter: LoginRouter())
    }
}
