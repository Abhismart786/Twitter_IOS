//
//  ContentView.swift
//  Naviagtion
//
//  Created by Abhishek Sehgal on 2024-10-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: ViewTwo())
                {
                    Text("Go to View Two")
                        .frame(width:300 , height: 100,alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(Color.black)
                        .cornerRadius(50)
                        
                }
                        
                    
            }
            .padding()
            
        }
      
    }
}

#Preview {
    ContentView()
}
