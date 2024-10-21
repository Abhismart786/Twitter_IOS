//
//  HomeView.swift
//  10Oct
//
//  Created by Abhishek Sehgal on 2024-10-10.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
        NavigationLink(destination: AnotherPage())
        {
            Text("Go to Another Page")
                .font(.title)
                .foregroundColor( .red)
        }
    }
}

#Preview {
    HomeView()
}
