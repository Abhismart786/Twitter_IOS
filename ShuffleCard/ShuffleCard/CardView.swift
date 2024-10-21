import SwiftUI

struct CardView: View {
    var card: Card
    var isFlipped: Bool

    var body: some View {
        Rectangle()
            .fill(isFlipped ? Color.blue : Color.gray)
            .frame(width: 100, height: 150)
            .overlay(
                Text(isFlipped ? "\(card.number)" : "?")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            )
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(number: 1), isFlipped: true)
    }
}

