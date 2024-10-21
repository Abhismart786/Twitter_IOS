//
//  firstprojectApp.swift
//  firstproject
//
//  Created by Abhishek Sehgal on 2024-09-16.
//

import SwiftUI

@main
struct firstprojectApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: firstprojectDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
