//
//  Location.swift
//  EduskuntaOnTheMap
//
//  Created by Mika Grönroos on 7.3.2025.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
