//
//  BlurView.swift
//  worksmart
//
//  Created by Tin Le on 3/11/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct BlurView: View {
    var body: some View {
        
        ZStack {
            Image("abstract_1")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 20)
            
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }
        }
        
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView()
    }
}
