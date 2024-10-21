//
//  ResultView.swift
//  GameRelatedExam
//
//  Created by Abhishek Sehgal on 2024-10-13.
//

import SwiftUI

struct ResultView: View {
    var moves: Int

    var body: some View {
        VStack {
            Text("Game Over!")
                .font(.largeTitle)
                .padding()

            Text("Moves: \(moves)")
                .font(.title)
                .padding()

            Button("Play Again") {
                // Logic to restart the game
            }
            .padding()
        }
    }
}
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(moves: 10) // Provide an actual integer value
    }
}
