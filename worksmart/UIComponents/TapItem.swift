//
//  TapItem.swift
//  worksmart
//
//  Created by Tin Le on 3/16/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct TapItem: View {
    var imageName:String
    var label:String
    var body: some View {
        VStack {
            Image(imageName)
            Text(label)
        }
    }
}

struct TapItem_Previews: PreviewProvider {
    static var previews: some View {
        TapItem(imageName: "first", label: "Profile")
    }
}
