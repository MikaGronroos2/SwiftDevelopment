//
//  Friend.swift
//  SwiftDatabasePractice
//
//  Created by Mika Grönroos on 28.2.2025.
//

import Foundation
import SwiftData


@Model
class Friend {
    var name: String
    var birthday: Date


    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }


    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
