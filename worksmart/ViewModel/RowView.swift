//
//  RowView.swift
//  worksmart
//
//  Created by Tin Le on 2/22/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var rowLabel: String = "Data"
    var rowData: String = "Test"
    var body: some View {
        HStack{
            Text(rowLabel)
                .font(.headline)
                
            Text(rowData)
                .font(.subheadline)
                .foregroundColor(.green)
        }
        
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(rowLabel: "Test", rowData: "TEst")
    }
}
