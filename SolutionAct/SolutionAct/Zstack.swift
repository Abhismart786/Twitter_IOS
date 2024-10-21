//
//  Zstack.swift
//  SolutionAct
//
//  Created by Abhishek Sehgal on 2024-09-26.
//

import SwiftUI

struct ZStackExample: View {
    var body: some View {
        ZStack {
            // Background Color
            Color.blue
                .edgesIgnoringSafeArea(.all) // Extend the color to the edges of the screen
            
            // Circle
            Circle()
                .fill(Color.white)
                .frame(width: 200, height: 200)
            
            // Text
            Text("Hello, ZStack!")
                .foregroundColor(.black)
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    ZStackExample()
}

