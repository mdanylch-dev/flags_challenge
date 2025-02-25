//
//  FlagsView.swift
//  Flag Challenge
//
//  Created by Mykyta Danylchenko on 25.02.2025.
//

import SwiftUI

struct FlagsView<VM>: View where VM: FlagsViewModelType {
    @ObservedObject var viewModel: VM
    var body: some View {
        content
            .padding(.horizontal, 32)
    }
    private var content: some View {
        Group {
            if viewModel.roundCurrent == 5 {
                resultView
            } else if !viewModel.rounds.isEmpty {
                roundView(viewModel.rounds[viewModel.roundCurrent])
            } else {
                initialView
            }
        }
    }

    private var initialView: some View {
        VStack(alignment: .center) {
            Text("Guess the Country by Its Flag!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text("""
                 Do you think you know world flags?

                 You'll see a flag in each round and must choose the correct country!

                 Tap the "🚀 Start" button and test your knowledge!
                 """)
            .font(.title3)
            .padding(.vertical, 32)

            Divider()

            startButton
        }
    }

    private func roundView(_ round: CountryRound) -> some View {
        VStack() {
            Spacer()

            Text("Which country does this flag belong to?")
                .font(.largeTitle)
                .multilineTextAlignment(.center)

            Spacer()

            Text(round.flag)
                .font(.system(size: 200))
                .background(.gray)
                .clipShape(.rect(cornerRadius: 10))

            Spacer()

            Button(action: {
                viewModel.getNextRound(selectedFlag: round.country1.flag)
            }, label: {
                Text(round.country1.name)
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                    .background(.yellow)
            })

            Button(action: {
                viewModel.getNextRound(selectedFlag: round.country2.flag)
            }, label: {
                Text(round.country2.name)
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                    .background(.yellow)
                    .padding(.vertical, 32)
            })
            Spacer()
        }

    }
    private var resultView: some View {
        VStack(alignment: .leading) {
            Spacer()
            let result = viewModel.result
            Text("Result")
            .font(.largeTitle)
            Text("""
            You got \(result) out of 5 correct!
            Great job! Want to try again and improve your score?
            """)
            .font(.title3)
            .padding(.top, 16)

            Divider()
                .padding(.vertical, 32)

            Text("Last game result")
                .font(.title)
            Text("✅ Correct: \(result)")
                .font(.title3)
            Text("❌ Wrong: \(5 - result)")
                .font(.title3)

            startButton
            Spacer()
        }
    }

    private var startButton: some View {
        Button(action: {
            viewModel.start()
        }, label: {
            Text("🚀 Start")
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                .background(.yellow)
                .padding(.vertical, 32)
        })
    }
}

#Preview {
    FlagsView(viewModel: FlagsViewModel(api: serverResponse()))
}
