//
//  ContentView.swift
//  EduskuntaOnTheMap
//
//  Created by Mika Grönroos on 7.3.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        Eduskunta()
            .modelContainer(for: [Edustaja.self])
    }
}

#Preview {
    ContentView()
}



