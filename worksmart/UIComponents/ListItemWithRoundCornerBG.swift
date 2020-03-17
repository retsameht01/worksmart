//
//  ListItemWithRoundCornerBG.swift
//  worksmart
//
//  Created by Tin Le on 3/13/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct ListItemWithRoundCornerBG: View {
    var text = "blah"
    var body: some View {
        HStack {
            Text(self.text)
                .font(Font.system(size: 25.0))
                .bold()
            Spacer()
        }
        
    }
}

struct ListItemWithRoundCornerBG_Previews: PreviewProvider {
    static var previews: some View {
        ListItemWithRoundCornerBG()
    }
}
