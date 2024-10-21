import SwiftUI

struct Caculator: View {
    @State private var display = "0"
    @State private var currentNumber = ""
    @State private var previousNumber = ""
    @State private var operation: String? = nil
    
    let buttons = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"]
    ]
    
    var body: some View {
        VStack {
            Text(display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black.opacity(0.1))
            
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            self.buttonTapped(button)
                        }) {
                            Text(button)
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: self.buttonWith(button), height: self.buttonHeight(button))
                                .background(self.isOperator(button) ? Color.orange : Color.gray)
                                .cornerRadius(self.buttonWith(button) / 2) // Round shape
                        }
                    }
                }
            }
            
            Button(action: reset) {
                Text("C")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .cornerRadius(20) // Round corners for the reset button
            }
        }
        .padding()
    }
    
    func reset() {
        display = "0"
        currentNumber = ""
        previousNumber = ""
        operation = nil
    }
    
    func buttonTapped(_ button: String) {
        switch button {
        case "0"..."9", ".":
            if currentNumber == "0" || display == "0" {
                currentNumber = button
            } else {
                currentNumber += button
            }
            display = currentNumber
        case "+", "-", "/", "*":
            previousNumber = currentNumber
            operation = button
            currentNumber = ""
        case "=":
            guard let operation = operation, let prev = Double(previousNumber), let current = Double(currentNumber) else {
                return
            }
            let result: Double
            switch operation {
            case "+": result = prev + current
            case "-": result = prev - current
            case "*": result = prev * current
            case "/": result = prev / current
            default: return
            }
            display = "\(result)"
            currentNumber = "\(result)"
            self.operation = nil
        default:
            break
        }
    }
    
    func isOperator(_ button: String) -> Bool {
        return button == "+" || button == "-" || button == "/" || button == "*"
    }
    
    func buttonWith(_ button: String) -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 5) / 4
    }
    
    func buttonHeight(_ button: String) -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 5) / 4
    }
}

#Preview {
    Caculator()
}

