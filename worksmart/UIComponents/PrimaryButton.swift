//
//  PrimaryButton.swift
//  worksmart
//
//  Created by Tin Le on 8/31/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct PrimaryButton: View {
    var body: some View {
        Button(action: {
            
        }){
            Text("Continue")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.green)
            .cornerRadius(5.0)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
    }
}
