//
//  FilteredMovieList.swift
//  FriendsFavoriteMovies
//
//  Created by Mika Grönroos on 28.2.2025.
//

import SwiftUI


struct FilteredMovieList: View {
    @State private var searchText = ""


    var body: some View {
        NavigationSplitView {
            MovieList(titleFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
