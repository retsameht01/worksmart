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
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.viewRouter.currentPage = "login"
                }){
                    Text("Logout")
                        .padding(.horizontal, 20)
                    .background(Color.green)
                    .foregroundColor(.white)
                }
                Spacer()
            }
            Text("Profile")
                .font(.title)
            
            Text(profileVM.weatherInfo)
        }.onAppear(perform: {self.profileVM.getWeather(city: "Atlanta")})
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewRouter: LoginRouter(), profileVM: ProfileVM())
    }
}
