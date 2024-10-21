//
//  CardMatchingGameApp.swift
//  GameRelatedExam
//
//  Created by Abhishek Sehgal on 2024-10-13.
//

import SwiftUI


struct CardMatchingGameApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}

struct CardMatchingGameApp_Previews: PreviewProvider {
    static var previews: some View {
        StartView() // You can preview any view here, like StartView or GameView
    }
}

