//
//  ProductListView.swift
//  worksmart
//
//  Created by Tin Le on 8/30/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct ProductListView: View {
    var allProducts: [Category] = []
    @Binding var selectedProducts: [Product]

    var body: some View {
        List{
            ForEach(allProducts) { category in
                Text(category.name).bold()
                ForEach(category.listProducts) { listProduct in
                    HStack{
                        Image("https://gposdev.com/30001/images/\(listProduct.imageUri)")
                        .scaleEffect()
                        .frame(width: 30, height: 30, alignment: .center)
                        
                        Text("\(listProduct.products[0].name)")
                        .font(.subheadline)
                        Spacer()
                        Text("\(Product.getFormattedPrice(value: listProduct.products[0].price))")
                            .foregroundColor(.red)
                        Button(action: {
                            
                            }){
                                Text("Add")
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .font(.subheadline)
                        }.onTapGesture {
                            self.addProduct(item: listProduct.products[0])
                        }
                    
                    }
                }
            }
        }
    }//End of view
    
    func addProduct(item: Product) {
        print("adding product")
        selectedProducts.append(item)
    }
}

struct ProductListView_Previews: PreviewProvider {
    @State static var products: [Product] = []
    
    static var previews: some View {
        ProductListView(selectedProducts: $products)
    }
}
