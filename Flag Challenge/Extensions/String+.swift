//
//  String+.swift
//  Flag Challenge
//
//  Created by Mykyta Danylchenko on 25.02.2025.
//

import Foundation

extension String {
    var getFlag: String {
        self
            .unicodeScalars
            .map({ 127397 + $0.value })
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }

    var getName: String {
        Locale(identifier: "en_US")
            .localizedString(forRegionCode: self) ?? ""
    }
}
