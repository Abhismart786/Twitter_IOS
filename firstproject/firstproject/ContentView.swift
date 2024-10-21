//
//  ContentView.swift
//  firstproject
//
//  Created by Abhishek Sehgal on 2024-09-16.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: firstprojectDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(firstprojectDocument()))
}
