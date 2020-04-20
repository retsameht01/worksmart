//
//  TransactionRow.swift
//  worksmart
//
//  Created by Tin Le on 3/16/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction
    var body: some View {
        HStack{
            Text("\(transaction.id)")
            
            Text(transaction.customerName)
                .foregroundColor(.white)
            
            Spacer()
            Text(transaction.total)
            .padding(.leading, 10)
            
            Text(transaction.paymentType)
                .foregroundColor(CustomColor.lightGray)
                .padding(.leading, 10)
            
            Spacer()
        }
        .padding(.bottom, 5)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: Transaction(id: 1, customerName: "Kelly White", total: "$19.95", paymentType: "Gift Card", services: ["Manicure", "SNS"], time: "03:16:2020 12:45"))
    }
}
