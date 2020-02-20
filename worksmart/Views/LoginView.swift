//
//  LoginView.swift
//  worksmart
//
//  Created by Tin Le on 2/18/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                Spacer()
                Text("Worksmart Login")
                    .font(.largeTitle).foregroundColor(Color.blue)
                    .padding(.vertical, 40)
                
                TextField("Email or username", text: self.$userName)
                    .padding()
                    .cornerRadius(20.0)
                
                TextField("Password", text: self.$password)
                    .padding()
                    .cornerRadius(20.0)
                
                NavigationLink(destination: MainScreen()){
                    VStack{
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                        .padding()
                            .frame(width:220, height:60)
                            .cornerRadius(15.0)
                    }.padding()
                    
                }.padding()
                 .font(.headline)
                
                Spacer()
            }.padding(.horizontal, 27.5)
                /*
                .background(LinearGradient(gradient: Gradient(colors:[ .white, .green]), startPoint: .top, endPoint: .bottom))*/
            //End of Vstack
        }//End of Navigation View
    
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
