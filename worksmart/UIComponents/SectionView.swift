//
//  SectionView.swift
//  worksmart
//
//  Created by Tin Le on 3/15/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    var sectionTitle: String
    var sectionSubtitle: String
    var backgroundColor: Color
    
    var body: some View {
         HStack(alignment: .center) {
                       Text(sectionTitle)
                           .font(.title)
                       .foregroundColor(.white)
                           .padding(.horizontal, 10)
                           .padding(.top, 15)
                           
                      Spacer()
                       
                       Text(sectionSubtitle)
                           .font(.largeTitle)
                           .foregroundColor(.white)
                           .padding(.trailing, 10)
                           .padding(.top, 15)
                   }
                   .frame(minWidth:0, maxWidth: .infinity, minHeight: 70, alignment: .topLeading)
                   .background(backgroundColor)
                   .cornerRadius(10.0)
                   .padding(.horizontal, 15)
                   .shadow(radius: 3.0, x: 3, y: 3)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(sectionTitle: "Income", sectionSubtitle:  "$99.00",backgroundColor:  CustomColor.niceGreen)
    }
}
