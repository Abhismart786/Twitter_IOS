//
//  GameScreen.swift
//  Assignmentgame
//
//  Created by Abhishek Sehgal on 2024-10-11.
//

import SwiftUI

struct GameScreen: View {
    @State private var cards = Card.generateCards()
    @State private var firstFlippedIndex: Int?
    @State private var moves = 0
    @State private var matchedPairs = 0
    
    var body: some View {
        VStack {
            Text("Moves: \(moves)")
                .font(.headline)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                ForEach(cards.indices, id: \.self) { index in
                    CardView(card: cards[index])
                        .onTapGesture {
                            handleCardTap(index: index)
                        }
                }
            }
        }
        .padding()
    }
    
    func handleCardTap(index: Int) {
        guard !cards[index].isFlipped else { return }
        cards[index].isFlipped.toggle()
        moves += 1
        
        if let firstIndex = firstFlippedIndex {
            // Check for match
            if cards[firstIndex].symbol == cards[index].symbol {
                // It's a match
                cards[firstIndex].isFlipped = true
                cards[index].isFlipped = true
                matchedPairs += 1
                if matchedPairs == cards.count / 2 {
                    // Navigate to result screen
                }
            } else {
                // Not a match
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    cards[firstIndex].isFlipped = false
                    cards[index].isFlipped = false
                }
            }
            firstFlippedIndex = nil
        } else {
            firstFlippedIndex = index
        }
    }
}

#Preview {
    GameScreen()
}
