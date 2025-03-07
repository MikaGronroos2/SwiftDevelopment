//
//  EduskuntaOnTheMapApp.swift
//  EduskuntaOnTheMap
//
//  Created by Mika Grönroos on 7.3.2025.
//

import SwiftUI
import SwiftData


@main
struct EduskuntaOnTheApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Edustaja.self])
    }
}
