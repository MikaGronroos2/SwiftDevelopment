//
//  BirthdaysApp.swift
//  SwiftDatabasePractice
//
//  Created by Mika Grönroos on 28.2.2025.
//
import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}


