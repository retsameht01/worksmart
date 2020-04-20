//
//  ReportsOverview.swift
//  worksmart
//
//  Created by Tin Le on 3/28/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct ReportsOverview: View {
    var body: some View {
        VStack {
            Text("Reports")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.bottom, 20)
                
            SectionView(sectionTitle: "Today", sectionSubtitle: "$125.99", backgroundColor: CustomColor.niceGreen)
            .padding(.bottom, 10)
            
            SectionView(sectionTitle: "Week", sectionSubtitle: "$450.00", backgroundColor: CustomColor.niceGreen)
            .padding(.bottom, 10)
            
            SectionView(sectionTitle: "Month", sectionSubtitle: "$2000.99", backgroundColor: CustomColor.niceGreen)
            .padding(.bottom, 10)
            
            SectionView(sectionTitle: "Year", sectionSubtitle: "$25000.99", backgroundColor: CustomColor.niceGreen)
            .padding(.bottom, 10)
            
            Spacer()
            }
        .background(CustomColor.cleanBlue)
        
    }
}

struct ReportsOverview_Previews: PreviewProvider {
    static var previews: some View {
        ReportsOverview()
    }
}
