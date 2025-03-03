//
//  EduskuntaFromWebApp.swift
//  EduskuntaFromWeb
//
//  Created by Mika Grönroos on 3.3.2025.
//

import SwiftUI
import SwiftData


@main
struct EduskuntaFromWebApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Edustaja.self])
    }
}
