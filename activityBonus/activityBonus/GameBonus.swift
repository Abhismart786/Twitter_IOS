import Foundation

class GameModel: ObservableObject {
    @Published var targetNumber: Int = 0
    @Published var attempts: Int = 0
    @Published var feedback: String = ""
    @Published var hint: String = ""
    @Published var isGameActive: Bool = false
    @Published var maxRange: Int = 100 // Default max range
    private var lastGuess: Int?
    
    func startGame(maxRange: Int) {
        self.maxRange = maxRange
        targetNumber = Int.random(in: 1...maxRange)
        attempts = 0
        feedback = ""
        hint = ""
        isGameActive = true
    }
    
    func guessNumber(_ guess: Int) {
        attempts += 1
        lastGuess = guess

        if guess < targetNumber {
            feedback = "Too low!"
        } else if guess > targetNumber {
            feedback = "Too high!"
        } else {
            feedback = "Congratulations! You guessed the number \(targetNumber)!"
            
           
            return
        }

        if attempts >= 3 && feedback != "Congratulations! You guessed the number \(targetNumber)!" {
            provideHint()
        }
    }
    
    private func provideHint() {
        guard let lastGuess = lastGuess else { return }
        
        // Define the hint range using maxRange
        let lowerBound = max(targetNumber - 10, 1)
        let upperBound = min(targetNumber + 10, maxRange) 

        hint = "Try a number between \(lowerBound) and \(upperBound)."
    }
    
    func resetGame() {
        isGameActive = false
        feedback = ""
        hint = ""
    }
}

