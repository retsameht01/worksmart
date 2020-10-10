//
//  OrderComplete.swift
//  worksmart
//
//  Created by Tin Le on 9/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct OrderComplete: View {
    var orderPaymentResult: String = ""
    @EnvironmentObject var checkoutCart: OrderCart
    @Binding var checkoutCurrentView: String
    var body: some View {
        VStack{
            Text("Order Completed")
            Text("Please allow 10-20 min before your food is ready!")
            Text("Thank you for placing your order with The Fancy Restaurant.")
            Text("Order Total: \(checkoutCart.getTotal())")
            Text("Payment Result: \(orderPaymentResult)")
            Spacer()
            Button(action: {
                self.doneBtnClick()
            }){
                Text("Done")
                .font(.headline)
                .foregroundColor(.blue)
            }
        }
        
    }
    
    func doneBtnClick() {
        //Need to handle storing order info with order # returned by GPOS service.
        checkoutCurrentView = "userInfo"
        checkoutCart.clear()
    }
}

struct OrderComplete_Previews: PreviewProvider {
    @State static var stringCurrentView = "test"
    static var previews: some View {
        OrderComplete(orderPaymentResult: "Result success", checkoutCurrentView: $stringCurrentView)
    }
}
