//
//  SettingsManager.swift
//  worksmart
//
//  Created by Tin Le on 9/6/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
class SettingsManager: ObservableObject {
    @Published var businessId: String = "30001"
    @Published var businessName: String = "Test Restaurant"
    @Published var businessPhone: String = "4045494567"
    @Published var businessEmail: String = "canjunexpress@email.com"
    @Published var businessAddress: String = "123 Sunset Bvld"
    @Published var businessCity: String = "Atlanta"
    @Published var bussinessState: String = "Georgia"
    @Published var businessZip: String = "30093"
    
}
