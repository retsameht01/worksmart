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
    
    static let UTC_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss"
    
    static func getTodayDate() -> String {
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = MM_DD_YYYY_FORMAT
        return outputFormat.string(from: Date())
    }
    
    static func getFormattedDateString(date: Date) -> String {
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = MM_DD_YYYY_FORMAT
        return outputFormat.string(from: date)
    }
    
    static func getCurrentUTCDateString() -> String {
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = UTC_DATE_FORMAT
        return outputFormat.string(from: Date())
    }
    
    
}
