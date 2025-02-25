//
//  CountryModel.swift
//  Flag Challenge
//
//  Created by Mykyta Danylchenko on 25.02.2025.
//

import Foundation

struct Country {
    let name: String
    let flag: String

    init(_ code: String) {
        self.name = code.getName
        self.flag = code.getFlag
    }
}

struct CountryRound {
    let country1: Country
    let country2: Country
    let flag: String
}
