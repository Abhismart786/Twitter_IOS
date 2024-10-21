//
//  ContentView.swift
//  Exam
//
//  Created by Abhishek Sehgal on 2024-09-27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var customText = ""
    @State private var selectedColor = Color.red
    @State private var selectedSize = ""
    @State private var isBold = false
    @State private var isUnderline = false
    @State private var isItalic = false
    @State private var outputValue: String = ""
    @State private var showAlert = false
    @State private var messageAlert = ""
    func convert() {
        if customText == "" {
            messageAlert = customText
            showAlert = true
        }
        // Set the alert message and show the alert
        
    }
    let colors = ["Temperature", "Length", "Weight"]
    let length = ["Meter", "Centimeter", "Millimeter"]
    let Temp = ["Celcius","Fahrenhiet","Kelvin"]
    let weight = ["Kilogram", "Gram", "Pound"]
    
    
    var body: some View {
        VStack {
            TextField("Enter your text", text: $customText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Picker("Pick Color", selection: $selectedColor) {
                
                Text("Temperature").tag(Color.red)
                Text("Length").tag(Color.blue)
                Text("Weight").tag(Color.green)
                
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            
            Picker("Temp", selection: $selectedSize) {
                ForEach(Temp, id: \.self) { Temp in
                    Text(Temp)
                }
            }
            Picker("Length", selection: $selectedSize) {
                ForEach(length, id: \.self) { length in
                    Text(length)
                }
            }
                    Picker("weight", selection: $selectedSize) {
                        ForEach(weight, id: \.self) { weight in
                            Text(weight)
                        }
                        
                    }
                
            
                
            
            // .pickerStyle(WheelPickerStyle())  // Change to Wheel style
            .padding()
            
            
                
                
                
            
            
            //            Toggle("Bold", isOn: $isBold)
            //                .padding()
            //            Toggle("Italic", isOn: $isItalic)
            //                .padding()
            //            Toggle("Underline", isOn: $isUnderline)
            //                .padding()
            //
                        Text(customText.isEmpty ? "Enter the value" : customText)
                            .foregroundColor(selectedColor)
                            .font(.system(size: fontSize(for: selectedSize), weight: isBold ? .bold : .regular))
                            .italic(isItalic)
                            .underline(isUnderline)
                            .padding()
            
//            Button(action: {
//                convertToFeet()
//            }) {
//                Text("Convert")
//                    .padding()
//                    .background(Color.red)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
//            .padding()
        }
       
        if customText == "" {
            Button("Convert") {
                showAlert = true
                   }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Enter the value first"), message: Text(messageAlert),
                      dismissButton: .default(Text("OK")))
            }
        }
        else{
            Button("Convert") {
                showAlert = true
                   }
            
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
       
    
    //    func resetValues() {
    //        customText = ""
    //        selectedColor = .red
    //        selectedSize = "Small"
    //        isBold = false
    //        isItalic = false
    //        isUnderline = false
    func convertToFeet() {
        let formatter = MeasurementFormatter()
        var distanceInFeet = Measurement(value: Double(customText) ?? 0, unit: UnitLength.inches)
        distanceInFeet.convert(to: UnitLength.feet)
        //formatter.unitStyle = MeasurementFormatter.UnitStyle.long
        formatter.string(from: distanceInFeet) // 3,626.81 miles
        
        outputValue = formatter.description
    }
       
       
}
#Preview {
    ContentView()
}

