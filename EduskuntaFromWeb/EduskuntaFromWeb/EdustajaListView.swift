//
//  EdustajaListView.swift
//  Eduskunta
//
//  Created by Mika Grönroos on 28.2.2025.
//
import SwiftUI

struct EdustajaListView: View {
    @State private var category: EdustajaCategory 

    init(category: EdustajaCategory) {
        _category = State(initialValue: category)
    }

    var body: some View {
        List(category.members.indices, id: \.self) { index in
            NavigationLink(destination: EdustajaDetail(edustaja: category.members[index])) {
                EdustajaRow(edustaja: $category.members[index])
            }
        }
        .navigationTitle(category.name)
    }
}



#Preview {

}
