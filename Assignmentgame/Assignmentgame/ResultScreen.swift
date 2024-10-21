//
//  ResultScreen.swift
//  Assignmentgame
//
//  Created by Abhishek Sehgal on 2024-10-11.
//

import SwiftUI

struct ResultScreen: View {
    var moves: Int
    
    var body: some View {
        VStack {
            Text("Game Over!")
                .font(.largeTitle)
            Text("Total Moves: \(moves)")
                .font(.headline)
            Button("Play Again") {
                // Reset the game
                // You could reset state here using a function or a similar mechanism
            }
            .padding()
            .font(.title)
        }
    }
}
#Preview {
    ResultScreen(moves: 10)
}
