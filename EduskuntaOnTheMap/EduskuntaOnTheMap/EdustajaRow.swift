//
//  EdustajaRow.swift
//  EduskuntaFromWeb
//
//  Created by Mika Grönroos on 3.3.2025.
//

import SwiftUI

struct EdustajaRow: View {
    @Binding var edustaja: Edustaja

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(edustaja.first) \(edustaja.last)")
                    .font(.headline)
                Text("Seat Number: \(edustaja.seatNumber)")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Image(systemName: edustaja.isFavorite ? "star.fill" : "star")
                .font(.largeTitle)
                .foregroundColor(edustaja.isFavorite ? .yellow : .gray)
                .padding(15)
                .onTapGesture {
                    edustaja.isFavorite.toggle()
                }
        }
    }
}

