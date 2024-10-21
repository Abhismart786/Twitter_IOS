//
//  NaviagtionlinksApp.swift
//  Naviagtionlinks
//
//  Created by Abhishek Sehgal on 2024-10-15.
//

import SwiftUI

@main
struct NaviagtionlinksApp: App {
    init()
    {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
    }
    var body: some Scene {
        WindowGroup {
            RedOneView()
        }
    }
}
