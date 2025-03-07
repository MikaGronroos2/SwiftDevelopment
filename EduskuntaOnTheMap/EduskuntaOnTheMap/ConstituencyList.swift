//
//  SwiftUIView.swift
//  EduskuntaOnTheMap
//
//  Created by Mika Grönroos on 7.3.2025.
//

import SwiftUI

struct ConstituencyList: View {
    @Binding var edustajat: [Edustaja]
    var constituency: String

    var body: some View {
        VStack {
            Text("Constituency: \(constituency)")
                .font(.title)
                .padding()

            List {
                ForEach(edustajat.filter { $0.constituency == constituency }.sorted(by: { $0.first < $1.first }), id: \.personNumber) { edustaja in
                    EdustajaRow(edustaja: Binding(
                        get: { edustaja },
                        set: { updatedEdustaja in
                            if let index = edustajat.firstIndex(where: { $0.personNumber == edustaja.personNumber }) {
                                edustajat[index] = updatedEdustaja
                            }
                        }
                    ))
                }
            }
        }
    }
}
