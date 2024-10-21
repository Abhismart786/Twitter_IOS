//
//  ContentView.swift
//  Stacks
//
//  Created by Abhishek Sehgal on 2024-10-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color.red)
                .frame(width: 100,height: 100,alignment: .center)
            Circle()
                .fill(Color.green)
                .frame(width: 100,height: 100,alignment: .center)
            Circle()
                .fill(Color.yellow)
                .frame(width: 100,height: 100,alignment: .center)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
