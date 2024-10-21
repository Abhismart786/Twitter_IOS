//
//  StartView.swift
//  GameRelatedExam
//
//  Created by Abhishek Sehgal on 2024-10-13.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Card Matching Game")
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
            .padding()
        }
    }
}

#Preview {
    StartView()
}
