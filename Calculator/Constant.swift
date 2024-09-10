//
//  Constant.swift
//  Calculator
//
//  Created by Abhishek Dagwar on 06/09/24.
//

import Foundation

struct Constant {
    static let APP_SECRETE: String = {
        guard let apiSecrete = Bundle.main.object(forInfoDictionaryKey: "APP_SECRETE") as? String else {
            fatalError("APP_SECRETE not found in Info.plist")
        }
        return apiSecrete
    }()
}
