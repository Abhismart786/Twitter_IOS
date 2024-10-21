//
//  ContentView.swift
//  10Oct
//
//  Created by Abhishek Sehgal on 2024-10-10.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive =  false
    var body: some View {
       
        VStack {
            
            if isActive{
                HomeView()
            }else{
                VStack{
                    
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width:200,height:200)
                    Text("Welcome to my app")
                        .font(.largeTitle)
                        .foregroundStyle(.tint)
                }
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                        self.isActive = true
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
