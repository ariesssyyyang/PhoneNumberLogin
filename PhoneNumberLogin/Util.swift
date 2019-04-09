//
//  Util.swift
//  PhoneNumberLogin
//
//  Created by Aries Yang on 2019/4/9.
//  Copyright © 2019 Aries Yang. All rights reserved.
//

import Foundation

enum LoginError: String, Error {
    case unknown = "WTF, unkonwn error."
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

struct Util {
    static func addCountryCode(phoneNumber: String) -> String {
        return phoneNumber.replacingOccurrences(of: "0", with: "+886", options: .literal, range: phoneNumber.startIndex..<phoneNumber.index(after: phoneNumber.startIndex))
    }
}
