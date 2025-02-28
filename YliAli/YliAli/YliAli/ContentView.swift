//
//  ContentView.swift
//  YliAli
//
//  Created by Mika Grönroos on 28.2.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var game = YliAli(low: 1, high: 10)
    @State private var guessInput: String = ""
    @State private var currentGuess: String = ""
    @State private var guessesLeft: Int = 10
    @State private var currentAttempts: Int = 0
    @State private var gameOngoing: Bool = true
    
    var body: some View {
                 
            VStack {
                Text("Welcome to the High and Low Game")
                Text("Guess the number in between: \(game.low) and \(game.high)")
                Text("Guesses left: \(guessesLeft)  Current attempts: \(currentAttempts)")
                Text("Current guess was: \(currentGuess)")
                TextField("Add in your guess here", text: $guessInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .disabled(!gameOngoing)
                Button(action: {
                    if gameOngoing {
                        if let guess = Int(guessInput) {
                            let attemptedGuess = game.arvaa(arvaus: guess)
                            switch attemptedGuess {
                            case .Ali:
                                currentGuess = "Low"
                            case .Yli:
                                currentGuess = "High"
                            case .Osuma:
                                currentGuess = "Correct"
                            }
                            advanceGameState(onGoingGame: $gameOngoing, attempts: $currentAttempts, guesses: $guessesLeft, attemptedGuess: attemptedGuess)
                        } else {
                            currentGuess = "Invalid input"
                        }
                    }
                }) {
                    HStack {
                        Text("Submit Guess")
                    }.padding()
                        .background(gameOngoing ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(!gameOngoing)
                
                if !gameOngoing {
                    Button(action: {
                        resetGame()
                    }) {
                        HStack {
                            Text("Start New Game")
                        }.padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .padding()
        }
        

    func resetGame() {
        game = YliAli(low: 1, high: 10)
        guessInput = ""
        currentGuess = ""
        guessesLeft = 10
        currentAttempts = 0
        gameOngoing = true
    }

}



func advanceGameState(onGoingGame: Binding<Bool>, attempts: Binding<Int>, guesses: Binding<Int>, attemptedGuess: PeliTulos) {
    if attemptedGuess == .Osuma {
        onGoingGame.wrappedValue = false
    } else {
        attempts.wrappedValue += 1
        guesses.wrappedValue -= 1
        if guesses.wrappedValue == 0 {
            onGoingGame.wrappedValue = false
        }
    }
}


#Preview {
    ContentView()
}
