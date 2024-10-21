//
//  InfoView.swift
//  10Oct
//
//  Created by Abhishek Sehgal on 2024-10-10.
//

import SwiftUI

struct InfoView: View {
    var enteredTxt : String
    var body: some View {
        VStack{
            Text("Hello")
            Text(enteredTxt).font(.largeTitle)
        }
        .navigationTitle("Info")
        .padding()
}
}

#Preview {
    InfoView(enteredTxt  : "")
}
