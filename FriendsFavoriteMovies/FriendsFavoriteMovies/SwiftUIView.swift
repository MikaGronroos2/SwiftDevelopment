//
//  SwiftUIView.swift
//  FriendsFavoriteMovies
//
//  Created by Mika Grönroos on 28.2.2025.
//

import SwiftUI


struct FilteredMovieList: View {
    var body: some View {
        MovieList()
    }
}


#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
