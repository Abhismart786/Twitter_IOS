//
//  ContentView.swift
//  Assignmentgame
//
//  Created by Abhishek Sehgal on 2024-10-11.
//

import SwiftUI

// Card Model
struct Card: Identifiable {
    let id = UUID()
    var symbol: String
    var isFlipped: Bool = false
    static func generateCards() -> [Card] {
        let symbols = ["🐶", "🐱", "🐰", "🦊", "🐻", "🐼", "🦁", "🐮"]
        var cards = symbols + symbols // Duplicate for matching pairs
        cards.shuffle()
        return cards.map { Card(symbol: $0) }
    }
}

// Card View
struct CardView: View {
    var card: Card

    var body: some View {
        Rectangle()
            .fill(card.isFlipped ? Color.white : Color.blue)
            .frame(width: 80, height: 120)
            .overlay(
                Text(card.isFlipped ? card.symbol : "?")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            )
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

// Game View
struct GameView: View {
    @State private var cards = Card.generateCards()
    @State private var flippedIndices: [Int] = []
    @State private var moves = 0
    @State private var matchedCount = 0
    @State private var showResult = false

    var body: some View {
        VStack {
            Text("Moves: \(moves)")
                .font(.headline)
                .padding()

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                ForEach(cards.indices, id: \.self) { index in
                    CardView(card: cards[index])
                        .onTapGesture {
                            handleCardTap(index: index)
                        }
                }
            }
            .padding()
        }
        .navigationTitle("Memory Game")
        .alert(isPresented: $showResult) {
            Alert(title: Text("Game Over"),
                  message: Text("You made \(moves) moves!"),
                  dismissButton: .default(Text("Play Again"), action: {
                resetGame()
            }))
        }
    }

    private func handleCardTap(index: Int) {
        guard !cards[index].isFlipped, flippedIndices.count < 2 else { return }

        cards[index].isFlipped = true
        flippedIndices.append(index)

        if flippedIndices.count == 2 {
            moves += 1
            checkForMatch()
        }
    }

    private func checkForMatch() {
        let firstIndex = flippedIndices[0]
        let secondIndex = flippedIndices[1]

        if cards[firstIndex].symbol == cards[secondIndex].symbol {
            cards[firstIndex].isFlipped = true
            cards[secondIndex].isFlipped = true
            matchedCount += 1

            if matchedCount == cards.count / 2 {
                showResult = true
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                cards[firstIndex].isFlipped = false
                cards[secondIndex].isFlipped = false
            }
        }
        flippedIndices.removeAll()
    }

    private func resetGame() {
        cards = Card.generateCards()
        moves = 0
        matchedCount = 0
        flippedIndices.removeAll()
    }
}

// Start View
struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Memory Card Game!")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: GameView()) {
                    Text("Start Game")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Memory Card Game")
        }
    }
}

// Main App Entry
@main
struct MemoryCardGameApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}

// Preview
struct MemoryCardGameApp_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
