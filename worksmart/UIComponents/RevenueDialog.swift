//
//  RevenueDialog.swift
//  worksmart
//
//  Created by Tin Le on 2/22/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct RevenueDialog: View {
    var body: some View {
        VStack(alignment: .leading){
            RowView(rowLabel: "Sarah Parker", rowData: "Full set for $13.99 Tips $7.00")
            RowView(rowLabel: "John Smith", rowData: "Haircut for $14.00 Tips $5.00")
            RowView(rowLabel: "Nancy Lee", rowData: "Nail Polish for $12.00 Tips $6.00")
                .padding(.bottom, 20)
            RowView(rowLabel: "Total", rowData: "$39.99")
            RowView(rowLabel: "Total Tips", rowData: "$18.00")
        }
    }
}

struct RevenueDialog_Previews: PreviewProvider {
    static var previews: some View {
        RevenueDialog()
    }
}
