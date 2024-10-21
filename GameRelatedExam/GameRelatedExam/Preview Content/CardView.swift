//
//  CardView.swift
//  GameRelatedExam
//
//  Created by Abhishek Sehgal on 2024-10-13.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        Rectangle()
            .fill(card.isFlipped ? Color.white : Color.blue)
            .frame(width: 70, height: 100)
            .overlay(
                Text(card.isFlipped ? card.symbol : "")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            )
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a sample card for the preview
        CardView(card: Card(symbol: "🐶", isFlipped: true))
    }
}
