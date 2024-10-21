import SwiftUI

enum Emoji: String, CaseIterable {
    case 😀, 🥰, 🥸, 😎
}

struct ContentView: View {
    @State private var selection: Emoji = .😎

    var body: some View {
        NavigationView{
            VStack {
                Text(selection.rawValue)
                    .font(.system(size: 150))
                    .accessibilityLabel("Selected emoji: \(selection.rawValue)")

                Picker("Select Emoji", selection: $selection) {
                    ForEach(Emoji.allCases, id: \.self) { emoji in
                        Text(emoji.rawValue)
                            .tag(emoji) // Ensure each emoji has a tag
                    }
                    
                  
                }
                .pickerStyle(SegmentedPickerStyle())
                
                .padding()
            }
            .navigationTitle("Emoji Picker!")
        }
       
      
    }
}

#Preview {
    ContentView()
}
