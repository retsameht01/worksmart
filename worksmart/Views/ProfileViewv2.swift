//
//  ProfileViewv2.swift
//  worksmart
//
//  Created by Tin Le on 3/13/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import SwiftUI

struct ProfileViewv2: View {
    var body: some View {
        VStack(alignment:.leading) {
            VStack(alignment: .leading) {
                Text("Fancy Salon")
                .font(Font.system(size: 35.0))
                .fontWeight(.bold)
                    .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                    .padding(.top, 5)
                
                Text(getTodayDate())
                .font(Font.system(size: 18.0))
                    .padding(.bottom, 10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
            }
            .frame(minWidth:0, maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
            .padding(.horizontal, 5)
            .background(CustomColor.niceGreen)
            .shadow(radius: 2.0, x: 2, y: 2)
            
            Text("Hi, Jessica")
                .foregroundColor(CustomColor.pastelYellow)
                .font(.headline)
                .padding(.horizontal, 10)
                .padding(.bottom, 20)
                .padding(.top, 10)
                
            SectionView(sectionTitle: "Income", sectionSubtitle: "$123.99", backgroundColor: CustomColor.niceGreen)
               .padding(.bottom, 10)
            
            SectionView(sectionTitle: "Tips", sectionSubtitle: "$59.99", backgroundColor: CustomColor.niceGreen)
            .padding(.bottom, 25)
            
            SectionView(sectionTitle: "Customers Served", sectionSubtitle: "29", backgroundColor: CustomColor.pastelCoral)
                   .padding(.bottom, 25)
            
            SectionView(sectionTitle: "Appointments", sectionSubtitle: "3", backgroundColor: CustomColor.grayBlue)
            
            AppointmentRow(column1Text: "10:35", column2Text: "Michelle Smith", column3Text: "Pedicure", column2TextColor: .white )
            
            AppointmentRow(column1Text: "10:35", column2Text: "Kelly Pirk", column3Text: "SNS", column2TextColor: .white )
            
            AppointmentRow(column1Text: "10:35", column2Text: "Mia McBride", column3Text: "Nail Design", column2TextColor: .white )
            
            
            
            Spacer()
        }
        .background(
        LinearGradient(gradient: Gradient(colors: [CustomColor.cleanBlue, CustomColor.pastelCoral]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
    }
    
    func getTodayDate() -> String{
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = "EEEE MMMM dd HH:mm"
        return outputFormat.string(from: Date())
    }
    
    func getBasicTimpStamp() -> String {
        let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .short)
        return timestamp
    }
}

struct ProfileViewv2_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewv2()
    }
}
