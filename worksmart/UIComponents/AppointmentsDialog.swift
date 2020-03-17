//
//  AppointmentsDialog.swift
//  worksmart
//
//  Created by Tin Le on 2/22/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct AppointmentsDialog: View {
    var body: some View {
        VStack(alignment: .leading){
            RowView(rowLabel: "Sarah Parker", rowData: "Full set @ 3.45")
            RowView(rowLabel: "John Smith", rowData: "Haircut @ 12:15")
            RowView(rowLabel: "Nancy Lee", rowData: "Nail Polish @ 11:20")
        }
        
    }
}

struct AppointmentsDialog_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentsDialog()
    }
}
