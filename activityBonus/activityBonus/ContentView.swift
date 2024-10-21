import SwiftUI

struct ContentView: View {
    @StateObject private var gameModel = GameModel()
    @State private var maxRange: String = "100"
    @State private var guess: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if gameModel.isGameActive {
                    gameView
                } else {
                    difficultyView
                }
            }
            .padding()
            .navigationTitle("Guess the Number")
        }
    }
    
    var difficultyView: some View {
        VStack {
            Text("Select Difficulty")
                .font(.headline)
            TextField("Max Range", text: $maxRange)
                .keyboardType(.numberPad)
                .padding()
                .border(Color.gray)
            
            Button("Start Game") {
                if let range = Int(maxRange), range > 0 {
                    gameModel.startGame(maxRange: range)
                }
            }
            .padding()
        }
    }
    
    var gameView: some View {
        VStack {
            Text("Attempts: \(gameModel.attempts)")
            TextField("Your Guess", text: $guess)
                .keyboardType(.numberPad)
                .padding()
                .border(Color.gray)

            Button("Submit Guess") {
                if let guessInt = Int(guess) {
                    gameModel.guessNumber(guessInt)
                    guess = ""
                }
            }
            .padding()
            
           
            Text(gameModel.feedback)
                .font(.headline)
                .foregroundColor(gameModel.feedback.contains("Congratulations") ? .green : .red)
            if !gameModel.hint.isEmpty {
                Text(gameModel.hint)
                    .foregroundColor(.red)
            }
            
            Button("Restart Game") {
                gameModel.resetGame()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

