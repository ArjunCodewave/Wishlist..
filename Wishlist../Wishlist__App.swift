//
//  Wishlist__App.swift
//  Wishlist..
//
//  Created by Arjun Rana on 15/04/26.
//

import SwiftUI
import SwiftData

@main
struct Wishlist__App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
