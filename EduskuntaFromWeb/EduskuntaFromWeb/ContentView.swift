//
//  ContentView.swift
//  Eduskunta
//
//  Created by Mika Grönroos on 28.2.2025.
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
