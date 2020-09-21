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
    var body: some View {
        VStack{
            Text("Order Completed")
            Text("Please allow 10-20 min before your food is ready!")
            Text("Thank you for placing your order with The Fancy Restaurant.")
            Text("Order Total: \(checkoutCart.getTotal())")
            Text("Payment Result: \(orderPaymentResult)")
            Spacer()
        }
        
    }
}

struct OrderComplete_Previews: PreviewProvider {
    static var previews: some View {
        OrderComplete(orderPaymentResult: "Result success")
    }
}
