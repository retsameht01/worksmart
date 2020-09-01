//
//  OrderDetailsView.swift
//  worksmart
//
//  Created by Tin Le on 8/31/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI
//TODO show this as a popup, instead of another page :)
struct OrderDetailsView: View {
    @EnvironmentObject var checkoutCart: OrderCart
    @Binding var checkoutPage: String
    var body: some View {
        VStack{
            Text("Order Details:")
            List{
                ForEach(checkoutCart.products) { product in
                    HStack{
                        Text("\(product.name)")
                        Spacer()
                        Text("\(Product.getFormattedPrice(value: product.price))")
                    }
                }
            }
            Text("Total: \(checkoutCart.getTotal())")
            Spacer()
            
            Button(action:{
                self.close()
            }){
                Text("Close")
            }
            
        }
    }//end of view
    
    func close() {
        checkoutPage = "userInfo"
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    @State static var page: String = ""
    static var previews: some View {
        OrderDetailsView(checkoutPage: $page)
    }
}
