//
//  Edustaja.swift
//  Eduskunta
//
//  Created by Mika Grönroos on 28.2.2025.
//

struct Edustaja: Hashable, Codable, Identifiable {
    var hetekaId: String
    var seatNumber: Int
    var lastname: String
    var firstname: String
    var party: String
    var minister: Bool
    var pictureUrl: String
    
    var id: String {
        hetekaId
    }

}
