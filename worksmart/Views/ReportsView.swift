//
//  ReportsView.swift
//  worksmart
//
//  Created by Tin Le on 2/19/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct ReportsView: View {
    let transactions: [Transaction] = [
        Transaction(id: 1, customerName: "Kelly White", total: "$19.95", paymentType: "AMEX", services: ["Manicure", "SNS"], time: "03:16:2020 12:45"),
        Transaction(id: 2, customerName: "Nancy Black", total: "$19.95", paymentType: "Credit", services: ["Pedicure", "SNS"], time: "03:16:2020 12:45"),
        Transaction(id: 3, customerName: "Karl McVee", total: "$19.95", paymentType: "Cash", services: ["SNS", "SNS"], time: "03:16:2020 12:45"),
        Transaction(id: 4, customerName: "Annie Smith", total: "$19.95", paymentType: "Cash", services: ["Nail Recovery", "SNS"], time: "03:16:2020 12:45"),
        Transaction(id: 5, customerName: "Angela King", total: "$19.95", paymentType: "Debit", services: ["Extension", "SNS"], time: "03:16:2020 12:45"),
        Transaction(id: 6, customerName: "Vicky McCormick", total: "$19.95", paymentType: "VISA", services: ["Full Set", "SNS"], time: "03:16:2020 12:45"),
        Transaction(id: 7, customerName: "Linda Greene", total: "$19.95", paymentType: "DISCOVER", services: ["Full Set", "SNS"], time: "03:16:2020 12:45"),
        Transaction(id: 8, customerName: "Jennifer West", total: "$19.95", paymentType: "VISA", services: ["Pedicure", "SNS"], time: "03:16:2020 12:45"),
        Transaction(id: 9, customerName: "Andrea Tank", total: "$19.95", paymentType: "VISA", services: ["SNS", "SNS"], time: "03:16:2020 12:45"),
        Transaction(id: 10, customerName: "Tammy Putt", total: "$19.95", paymentType: "Gift Card", services: ["Nail Art", "SNS"], time: "03:16:2020 12:45")
    ]
    
    var body: some View {
        
        ScrollView {
            
        
        VStack{
            HStack{
                Spacer()
            }
            
            Text("Today Transactions")
                .font(.title)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Text("Total: $123.00")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            ForEach(transactions, id: \.self) { trans in
                TransactionRow(transaction: trans)
            }
        }
    }
        .padding(.horizontal, 10)
        .background(
        LinearGradient(gradient: Gradient(colors: [CustomColor.niceGreen, CustomColor.purpleBlue]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
    }
}

struct ReportsView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsView()
    }
}
