//
//  AppointmentRow.swift
//  worksmart
//
//  Created by Tin Le on 3/15/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct AppointmentRow: View {
    var column1Text: String
    var column2Text: String
    var column3Text: String
    var column2TextColor: Color
    
    var body: some View {
         HStack(alignment: .center){
                       Text(column1Text)
                           .font(.headline)
                           
                       Text(column2Text)
                           .font(.headline)
                           .foregroundColor(column2TextColor)
                           
                       Spacer()
                       Text(column3Text)
                           .font(.footnote)
                   }
                   .padding(.top, 7)
                   .padding(.horizontal, 20)
    }
}

struct AppointmentRow_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentRow(column1Text: "10:35", column2Text: "Kelly Smith", column3Text: "Pedicure", column2TextColor: CustomColor.niceGreen )
    }
}
