//
//  ApiUtil.swift
//  worksmart
//
//  Created by Tin Le on 7/10/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//
import CommonCrypto
import Foundation

class ApiUtil {
    static func encryptHMACSHA1(key: String, data: String) ->String  {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA256), key, key.count, data, data.count, &digest)
        let data = Data(_: digest)
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
    
    static func encodeBase64String(input: String) -> String {
        let utfEncodeString = input.data(using: String.Encoding.utf8)!
        return utfEncodeString.base64EncodedString()
    }
}
