import SwiftUI

struct ButtonExample1: View {
    @State private var message = "Pargol is awesome"
    @State private var showAlert = false
    @State private var messageAlert = ""

    func buttonAction() {
        if message == "Pargol is awesome" {
            message = "for sure"
        } else {
            message = "Pargol is awesome"
        }
        // Set the alert message and show the alert
        messageAlert = message
        showAlert = true
    }
    
    var body: some View {
        VStack {
            Text(message)
                .padding()

            Button(action: buttonAction) {
                Text("Change Message")
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: buttonAction) {
                Text("Button1")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.red)
                    .cornerRadius(10)
            }

            Button(action: buttonAction) {
                Text("Button2")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Important"), message: Text(messageAlert),
                  dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    ButtonExample1()
}

