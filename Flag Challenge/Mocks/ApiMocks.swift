//
//  ApiMocks.swift
//  Flag Challenge
//
//  Created by Mykyta Danylchenko on 25.02.2025.
//

import Foundation
import Combine

protocol ServerApi {
    func getData() -> AnyPublisher<[CountryRound], Never>
}

struct serverResponse: ServerApi {
    func getData() -> AnyPublisher<[CountryRound], Never> {
        Just(
            COUNTRY_CODES
                .shuffled()
                .prefix(10)
                .map({ Country(($0)) })
        )
        .map { countries in
            zip(countries[0..<5], countries[5..<10]).map {
                CountryRound(
                    country1: $0.0,
                    country2: $0.1,
                    flag: [$0.0.flag, $0.1.flag].randomElement()!
                )
            }
        }
        .eraseToAnyPublisher ()
    }
}
