//
//  Flag_ChallengeApp.swift
//  Flag Challenge
//
//  Created by Mykyta Danylchenko on 25.02.2025.
//

import SwiftUI

@main
struct Flag_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            FlagsView(viewModel: FlagsViewModel(api: serverResponse()))
        }
    }
}
