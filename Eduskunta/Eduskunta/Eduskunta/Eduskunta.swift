//
//  Eduskunta.swift
//  Eduskunta
//
//  Created by Mika Grönroos on 28.2.2025.
//

import SwiftUI

struct Eduskunta: View {
    @State private var edustajat: [Edustaja] = []
    @State private var categories: [EdustajaCategory] = []

    var body: some View {
        NavigationView {
            List(categories) { category in
                NavigationLink(destination: EdustajaListView(category: category)) {
                    Text(category.name)
                        .font(.headline)
                }
            }
            .navigationTitle("Edustajat by Puolueet")
        }
        .onAppear {
            edustajat = loadEdustajat()
            categories = groupEdustajatByParty(edustajat)
        }
    }
}

func groupEdustajatByParty(_ edustajat: [Edustaja]) -> [EdustajaCategory] {
    let grouped = Dictionary(grouping: edustajat, by: { $0.party })
    return grouped.map { EdustajaCategory(name: $0.key, members: $0.value) }
}



#Preview {
    Eduskunta()
}
