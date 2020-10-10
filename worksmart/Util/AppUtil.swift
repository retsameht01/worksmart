//
//  AppUtil.swift
//  worksmart
//
//  Created by Tin Le on 9/20/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation

class AppUtil {
    
    static func toJson(kvp: KeyValuePairs<String, Any>)->String {
        var json = "{"
        for (index, key_value) in kvp.enumerated() {
            json += "\"\(key_value.key)\":\"\(key_value.value)\""
            if (index < (kvp.count - 1)) {
               json += ","
            }
        }
        json += "}"
        return json
    }
    
    static func truncateString(rawString: String, offset: Int) -> String {
        if(rawString.count <= offset) {
            return rawString
        }
        
        let truncationRange = rawString.index(rawString.startIndex, offsetBy: offset)
        let truncatedSubString = rawString[truncationRange]
        return String(truncatedSubString)
    }
    
    static func formatDouble(input: Double) -> Double {
        return Double(String(format:"%.2f", input)) ??  input
    }
}
