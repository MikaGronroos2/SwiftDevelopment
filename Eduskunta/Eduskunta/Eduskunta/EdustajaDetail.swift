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
            AsyncImage(url: URL(string: baseUrl+parsedUrl)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
            Text(edustaja.firstname + " " + edustaja.lastname)
        }
        
        
        
        
    }
}

#Preview {
    EdustajaDetail(edustaja: Edustaja(hetekaId: 1, seatNumber: 2, lastname: "Hei", firstname: "Moi", party: "Keskus", minister: true, pictureUrl: "attachment/member/pictures/Halla-aho-Jussi-web-1109.jpg"))
}
