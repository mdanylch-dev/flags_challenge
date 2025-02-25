//
//  FlagsViewModel.swift
//  Flag Challenge
//
//  Created by Mykyta Danylchenko on 25.02.2025.
//

import Foundation
import Combine

class FlagsViewModel: FlagsViewModelType {

    private var cancelBag: Set<AnyCancellable> = []
    private let dataService: ServerApi

    // Outputs
    @Published private(set) var rounds: [CountryRound] = []
    @Published private(set) var roundCurrent: Int = 0
    @Published private(set) var result: Int = 0

    // MARK: - Intialization
    init(api: ServerApi) {
        self.dataService = api
    }

    func start() {
        rounds = []
        result = 0
        roundCurrent = 0

        dataService.getData()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                guard let self else { return }
                self.rounds = data
            }
            .store(in: &cancelBag)
    }

    func getNextRound(selectedFlag: String) {
        let increment = rounds[roundCurrent].flag == selectedFlag ? 1 : 0
        result += increment
        guard roundCurrent < 5 else { return }
        roundCurrent += 1
    }
}

// MARK: - View model protocol
protocol FlagsViewModelType: ObservableObject {
    // Inputs
    func start()
    func getNextRound(selectedFlag: String)

    // Outputs
    var rounds: [CountryRound] { get }
    var roundCurrent: Int { get }
    var result: Int { get }
}
