//
//  EdustajaDetail.swift
//  Eduskunta
//
//  Created by Mika Grönroos on 28.2.2025.
//
import SwiftUI

struct EdustajaDetail: View {
    var edustaja: Edustaja

    var body: some View {
        let baseUrl: String = "https://users.metropolia.fi/~peterh/edustajakuvat/"
        let parsedUrl: String = edustaja.parsedPictureUrl()
        
        VStack {
            Text(edustaja.party).font(.largeTitle)
            Text("\(edustaja.constituency)")
            Text("\(edustaja.personNumber)")
            AsyncImage(url: URL(string: baseUrl + parsedUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } placeholder: {
                ProgressView()
            }
            Text("\(edustaja.first) \(edustaja.last)\(edustaja.minister ? ": Ministeri" : "")")
            Text("\(edustaja.bornYear)")
            Text("\(edustaja.twitter)")
            Text("\(edustaja.constituency)")
            
            
        }
    }
}

#Preview {
    EdustajaDetail(edustaja: Edustaja(personNumber: 1, seatNumber: 2, last: "Hei", first: "Moi", party: "Keskus", minister: true, picture: "attachment/member/pictures/Halla-aho-Jussi-web-1109.jpg", twitter: "", bornYear: 1960, constituency: "Helsinki"))
}
