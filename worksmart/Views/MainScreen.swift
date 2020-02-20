//
//  ContentView.swift
//  worksmart
//
//  Created by Tin Le on 2/18/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    @State private var selection = 0
    @ObservedObject var viewRouter: LoginRouter
 
    var body: some View {
        TabView(selection: $selection){
            ProfileView(viewRouter: viewRouter)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Profile")
                    }
                }
                .tag(0)
            
            ScheduleView()
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Schedule")
                    }
                }
                .tag(1)
            
            ReportsView()
            .tabItem {
                VStack {
                    Image("first")
                    Text("Reports")
                }
            }
            .tag(2)
            
            NotificationsView()
            .tabItem {
                VStack {
                    Image("second")
                    Text("Notifications")
                }
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(viewRouter: LoginRouter())
    }
}
