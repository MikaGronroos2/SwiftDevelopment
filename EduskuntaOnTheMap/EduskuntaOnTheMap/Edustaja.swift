//
//  Edustaja.swift
//  Eduskunta
//
//  Created by Mika Grönroos on 28.2.2025.
//
import Foundation
import SwiftData

@Model
final class Edustaja: Identifiable, Codable {
    var personNumber: Int
    var seatNumber: Int
    var last: String
    var first: String
    var party: String
    var minister: Bool
    var picture: String
    var twitter: String
    var bornYear: Int
    var constituency: String
    var isFavorite: Bool = false
    
    var id: Int {
        personNumber
    }
    
    init(personNumber: Int, seatNumber: Int, last: String, first: String, party: String, minister: Bool, picture: String, twitter: String, bornYear: Int, constituency: String) {
        self.personNumber = personNumber
        self.seatNumber = seatNumber
        self.last = last
        self.first = first
        self.party = party
        self.minister = minister
        self.picture = picture
        self.twitter = twitter
        self.bornYear = bornYear
        self.constituency = constituency
    }
    
    required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            personNumber = try container.decode(Int.self, forKey: .personNumber)
            seatNumber = try container.decode(Int.self, forKey: .seatNumber)
            last = try container.decode(String.self, forKey: .last)
            first = try container.decode(String.self, forKey: .first)
            party = try container.decode(String.self, forKey: .party)
            minister = try container.decode(Bool.self, forKey: .minister)
            picture = try container.decode(String.self, forKey: .picture)
            twitter = try container.decode(String.self, forKey: .twitter)
            bornYear = try container.decode(Int.self, forKey: .bornYear)
            constituency = try container.decode(String.self, forKey: .constituency)
        }
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(personNumber, forKey: .personNumber)
            try container.encode(seatNumber, forKey: .seatNumber)
            try container.encode(last, forKey: .last)
            try container.encode(first, forKey: .first)
            try container.encode(party, forKey: .party)
            try container.encode(minister, forKey: .minister)
            try container.encode(picture, forKey: .picture)
            try container.encode(twitter, forKey: .twitter)
            try container.encode(bornYear, forKey: .bornYear)
            try container.encode(constituency, forKey: .constituency)
        }
    
    func parsedPictureUrl() -> String {
        guard let url = URL(string: picture) else {
            return picture
        }
        return url.lastPathComponent
    }
    
    private enum CodingKeys: String, CodingKey {
            case personNumber
            case seatNumber
            case last
            case first
            case party
            case minister
            case picture
            case twitter
            case bornYear
            case constituency
        }
    
}
