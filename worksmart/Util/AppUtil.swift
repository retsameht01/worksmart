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
}
