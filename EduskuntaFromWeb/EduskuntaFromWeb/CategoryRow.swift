//
//  CategoryRow.swift
//  EduskuntaFromWeb
//
//  Created by Mika Grönroos on 3.3.2025.
//

import SwiftUI

struct CategoryRow: View {
    @Binding var category: EdustajaCategory
    
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
        }
    }
}

#Preview {
    struct CategoryRowPreview: View {
        @State private var category = EdustajaCategory(name: "ps", members: [])
        
        var body: some View {
            CategoryRow(category: $category)
        }
    }
    
    return CategoryRowPreview()
}
