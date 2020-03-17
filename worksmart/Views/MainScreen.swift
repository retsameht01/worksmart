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
    //TODO refactor this to be injected. view should not care about instantiating Vm
    @ObservedObject var viewModel: ProfileVM = ProfileVM()
 
    var body: some View {
        TabView(selection: $selection){
            ProfileViewv2()
                .tabItem { TapItem(imageName: "dashboard", label: "Overview") }
                .tag(0)
            
            ScheduleView()
                .tabItem { TapItem(imageName: "calendar", label: "Appointments") }
                .tag(1)
            
            ReportsView()
            .tabItem { TapItem(imageName: "reports", label: "Reports") }
            .tag(2)
            
            NotificationsView()
            .tabItem { TapItem(imageName: "notifications", label: "Notifications") }
            .tag(3)
            
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
