//
//  Edustaja.swift
//  Eduskunta
//
//  Created by Mika Grönroos on 28.2.2025.
//
import Foundation

struct Edustaja: Hashable, Codable, Identifiable {
    var hetekaId: Int
    var seatNumber: Int
    var lastname: String
    var firstname: String
    var party: String
    var minister: Bool
    var pictureUrl: String
    
    var id: Int {
        hetekaId
    }
    
    func parsedPictureUrl() -> String {
        guard let url = URL(string: pictureUrl) else {
            return pictureUrl
        }
        return url.lastPathComponent
    }
    
    
}

func loadEdustajat() -> [Edustaja] {
    guard let url = Bundle.main.url(forResource: "eduskunta", withExtension: "json") else {
        print("JSON file not found")
        return []
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode([Edustaja].self, from: data)
    } catch {
        print("Error loading JSON data: \(error)")
        return []
    }
}
