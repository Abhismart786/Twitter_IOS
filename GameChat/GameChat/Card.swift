//
//  Card.swift
//  GameChat
//
//  Created by Abhishek Sehgal on 2024-10-15.
//

import Foundation

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
