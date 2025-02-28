//
//  FriendsFavoriteMoviesApp.swift
//  FriendsFavoriteMovies
//
//  Created by Mika Grönroos on 28.2.2025.
//

import SwiftUI


@main
struct FriendsFavoriteMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Movie.self, Friend.self])
    }
}
