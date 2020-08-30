//
//  SelectedProductListView.swift
//  worksmart
//
//  Created by Tin Le on 8/30/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct SelectedProductListView: View {
    @Binding var products: [Product]
    var body: some View {
        VStack{
            Text("Selected Item(s):")
            List{
                ForEach(products) { product in
                    HStack{
                        Text("\(product.name)")
                        Spacer()
                        Text("\(Product.getFormattedPrice(value: product.price))")
                        Button(action: {
                            
                            }){
                                Text("Remove")
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .font(.subheadline)
                                
                        }.onTapGesture {
                            self.removeProduct(index: self.getProductIndex(product: product))
                        }
                    }
                }
            }
            Text("Total: \(getTotal())")
        }
        
    }//End of view
    
    func removeProduct(index: Int) {
        products.remove(at: index)
    }
    
    func getProductIndex(product: Product) -> Int {
        for (i, prdct) in products.enumerated() {
            if(product.id == prdct.id) {
                return i
            }
        }
        return 0
    }
    
    func getTotal() -> String {
        var total: Float = 0
        for product in products {
            total += product.price
        }
        return Product.getFormattedPrice(value: total)
    }
    
}

struct SelectedProductListView_Previews: PreviewProvider {
    @State static var previewProducts: [Product] = []
    static var previews: some View {
        SelectedProductListView(products: $previewProducts)
    }
}
