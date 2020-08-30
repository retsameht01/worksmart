//
//  DateUtil.swift
//  worksmart
//
//  Created by Tin Le on 7/10/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
class DateUtil {
    static let MM_DD_YYYY_FORMAT = "MM/dd/yyyy"
    
    static func getTodayDate() -> String {
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = MM_DD_YYYY_FORMAT
        return outputFormat.string(from: Date())
    }
}
