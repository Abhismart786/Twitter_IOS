import SwiftUI

struct ContentView: View {
    
    @State private var customText = ""
    @State private var selectedColor = Color.red
    @State private var selectedSize = "Small"
    @State private var isBold = false
    @State private var isUnderline = false
    @State private var isItalic = false
    
    let colors = ["Red", "Blue", "Green", "Black", "Yellow"]
    let sizes = ["Small", "Medium", "Large", "Extra Large", "XXL"]
    
    var body: some View {
        VStack {
            TextField("Enter your text", text: $customText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Picker("Pick Color", selection: $selectedColor) {
                Text("Red").tag(Color.red)
                Text("Blue").tag(Color.blue)
                Text("Green").tag(Color.green)
                Text("Black").tag(Color.black)
                Text("Yellow").tag(Color.yellow)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Picker("Text Size", selection: $selectedSize) {
                ForEach(sizes, id: \.self) { size in
                    Text(size)
                }
            }
           // .pickerStyle(WheelPickerStyle())  // Change to Wheel style
            .padding()
            
            Toggle("Bold", isOn: $isBold)
                .padding()
            Toggle("Italic", isOn: $isItalic)
                .padding()
            Toggle("Underline", isOn: $isUnderline)
                .padding()
            
            Text(customText.isEmpty ? "Pargol is amazing" : customText)
                .foregroundColor(selectedColor)
                .font(.system(size: fontSize(for: selectedSize), weight: isBold ? .bold : .regular))
                .italic(isItalic)
                .underline(isUnderline)
                .padding()
            
            Button(action: {
                resetValues()
            }) {
                Text("Reset")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
    
    func fontSize(for size: String) -> CGFloat {
        switch size {
        case "Small": return 16
        case "Medium": return 20
        case "Large": return 24
        case "Extra Large": return 32
        case "XXL": return 48
        default: return 16
        }
    }
    
    func resetValues() {
        customText = ""
        selectedColor = .red
        selectedSize = "Small"
        isBold = false
        isItalic = false
        isUnderline = false
    }
}

#Preview {
    ContentView()
}

