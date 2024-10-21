import SwiftUI

struct GameView: View {
    @State private var cards: [Card] = []
    @State private var selectedCard: Card?
    @State private var resultMessage: String = ""
    
    var body: some View {
        VStack {
            Text("Select the Card Position")
                .font(.largeTitle)
                .padding()

            HStack(spacing: 20) {
                ForEach(cards) { card in
                    CardView(card: card, isFlipped: selectedCard?.id == card.id)
                        .onTapGesture {
                            selectCard(card)
                        }
                }
            }
            .padding()

            if let selectedCard = selectedCard {
                Text("You selected card: \(selectedCard.number)")
                    .font(.headline)
                    .padding()

                Button("Check Position") {
                    checkPosition(for: selectedCard)
                }
                .padding()
            }

            Text(resultMessage)
                .font(.headline)
                .padding()
        }
        .onAppear(perform: startGame)
    }

    private func startGame() {
        let shuffledCards = (1...3).map { Card(number: $0) }.shuffled()
        cards = shuffledCards
        resultMessage = ""
        selectedCard = nil
    }

    private func selectCard(_ card: Card) {
        selectedCard = card
    }

    private func checkPosition(for card: Card) {
        let correctPosition = cards.firstIndex(where: { $0.id == card.id }) ?? -1
        if correctPosition == 0 {
            resultMessage = "Correct! The card \(card.number) is at the correct position."
        } else {
            resultMessage = "Wrong! The card \(card.number) is at position \(correctPosition + 1)."
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

