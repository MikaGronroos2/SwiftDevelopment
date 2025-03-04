//
//  CategoryRow.swift
//  EduskuntaFromWeb
//
//  Created by Mika Grönroos on 3.3.2025.
//

import SwiftUI

struct CategoryRow: View {
    @Binding var category: EdustajaCategory
    @Binding var selectedParties: Set<String>
    
    var body: some View {
        HStack {
            Text(category.name)
                .font(.title)
                .padding(15)
            
            Spacer()
            
            Image(systemName: category.isFavorite ? "star.fill" : "star")
                .font(.largeTitle)
                .foregroundColor(category.isFavorite ? .yellow : .gray)
                .padding(15)
                .onTapGesture {
                    category.isFavorite.toggle()
                }
            
            Toggle(isOn: Binding(
                get: { selectedParties.contains(category.name) },
                set: { isSelected in
                    if isSelected {
                        selectedParties.insert(category.name)
                    } else {
                        selectedParties.remove(category.name)
                    }
                }
            )) {
                Text("Select")
            }
            .labelsHidden()
            .padding(15)
        }
    }
}

