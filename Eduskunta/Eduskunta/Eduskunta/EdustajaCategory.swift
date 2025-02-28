//
//  EdustajaCategory.swift
//  Eduskunta
//
//  Created by Mika Grönroos on 28.2.2025.
//

import Foundation

struct EdustajaCategory: Identifiable {
    var id: String { name }
    var name: String
    var members: [Edustaja]
}
