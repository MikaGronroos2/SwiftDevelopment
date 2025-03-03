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
                    Text("\(edustaja.first) \(edustaja.last)")
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

}
