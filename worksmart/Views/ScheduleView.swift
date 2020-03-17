//
//  ScheduleView.swift
//  worksmart
//
//  Created by Tin Le on 2/19/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        VStack{
            ViewEventViewControllerPresentation()
        }.background(
        LinearGradient(gradient: Gradient(colors: [CustomColor.cleanBlue, CustomColor.pastelCoral]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
        
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerViewPresentation()
    }
}
