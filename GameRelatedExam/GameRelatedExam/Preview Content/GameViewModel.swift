//
//  GameViewModel.swift
//  GameRelatedExam
//
//  Created by Abhishek Sehgal on 2024-10-13.
//
import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    @Published var cards: [Card] = Card.generateCards()
    @Published var flippedIndices: [Int] = []
    @Published var moves: Int = 0
    var matchedCount: Int = 0

    func handleCardTap(index: Int) {
        guard !cards[index].isFlipped && flippedIndices.count < 2 else { return }
        
        flippedIndices.append(index)
        cards[index].isFlipped = true
        
        if flippedIndices.count == 2 {
            moves += 1
            checkForMatch()
        }
    }
    
    private func checkForMatch() {
        let firstIndex = flippedIndices[0]
        let secondIndex = flippedIndices[1]

        if cards[firstIndex].symbol == cards[secondIndex].symbol {
            cards[firstIndex].isMatched = true
            cards[secondIndex].isMatched = true
            matchedCount += 2
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.cards[firstIndex].isFlipped = self.cards[firstIndex].isMatched
               self.cards[secondIndex].isFlipped = self.cards[secondIndex].isMatched
               self.flippedIndices.removeAll()
           }
    }
    
    var isGameOver: Bool {
        matchedCount == cards.count
    }
}
