//
//  StartScreen.swift
//  Assignmentgame
//
//  Created by Abhishek Sehgal on 2024-10-11.
//

import SwiftUI

import SwiftUI

struct StartScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Memory Game!")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: GameScreen()) {
                    Text("Start Game")
                        .padding()
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Memory Game")
        }
    }
}

#Preview {
    StartScreen()
}
