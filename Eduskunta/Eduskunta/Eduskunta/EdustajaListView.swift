//
//  EdustajaListView.swift
//  Eduskunta
//
//  Created by Mika Grönroos on 28.2.2025.
//

import SwiftUI

struct EdustajaListView: View {
    var category: EdustajaCategory

    var body: some View {
        List(category.members) { edustaja in
            NavigationLink(destination: EdustajaDetail(edustaja: edustaja)) {
                VStack(alignment: .leading) {
                    Text("\(edustaja.firstname) \(edustaja.lastname)")
                        .font(.headline)
                    Text("Seat Number: \(edustaja.seatNumber)")
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle(category.name)
    }
}

#Preview {
    EdustajaListView(category: EdustajaCategory(name: "ps", members: [
        Edustaja(hetekaId: 1109, seatNumber: 0, lastname: "Halla-aho", firstname: "Jussi", party: "ps", minister: false, pictureUrl: ""),
        Edustaja(hetekaId: 1155, seatNumber: 1, lastname: "Kontula", firstname: "Anna", party: "vas", minister: false, pictureUrl: "")
    ]))
}
