import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            Text("Moves: \(viewModel.moves)")
                .font(.title)
                .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                ForEach(viewModel.cards.indices, id: \.self) { index in
                    CardView(card: viewModel.cards[index])
                        .onTapGesture {
                            viewModel.handleCardTap(index: index)
                        }
                }
            }
            .padding()
        }
        .navigationTitle("Card Matching Game")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.startNewGame()
        }
        .alert(isPresented: $viewModel.isGameOver) {
            Alert(
                title: Text("Game Over!"),
                message: Text("Moves: \(viewModel.moves)"),
                dismissButton: .default(Text("OK")) {
                    viewModel.startNewGame()
                }
            )
        }
    }
}
#Preview {
    
}
