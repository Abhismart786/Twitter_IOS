import SwiftUI

struct AnotherPage: View {
    @State private var userInput: String = ""
    @State private var activebtn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Please give me your name:")
                    .font(.largeTitle)
                    .padding()

                TextField("Enter your name", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                NavigationLink(destination: InfoView(enteredTxt: userInput), isActive: $activebtn) {
                    Button(action: {
                        if !userInput.isEmpty {
                            activebtn = true
                        }
                    }) {
                        Text("Show it")
                            .font(.headline)
                            .foregroundColor(Color.green)
                            .padding()
                    }
                    .disabled(userInput.isEmpty) // Disable the button if the input is empty
                }
            }
            .padding()
        }
    }
}



#Preview {
    AnotherPage()
}

