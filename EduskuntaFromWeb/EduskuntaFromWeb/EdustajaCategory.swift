//
//  EdustajaCategory.swift
//  Eduskunta
//
//  Created by Mika Grönroos on 28.2.2025.
//

import Foundation

import Foundation

struct EdustajaCategory: Identifiable {
    var id: String { name }
    var name: String
    var members: [Edustaja]
    
    var isFavorite: Bool {
        get {
            UserDefaults.standard.bool(forKey: name)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: name)
        }
    }
}
