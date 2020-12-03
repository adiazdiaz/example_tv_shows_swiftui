//
//  PopularTVShowsView.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 14/11/2020.
//

import SwiftUI

struct PopularTVShowsView: View {
    let mock: Bool?

    @StateObject var popularTVShowsViewModel = PopularTVShowsViewModel()
    
    let columns:[GridItem] = Array(repeating: .init(.flexible(), spacing: 20), count: 3)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Popular TV Shows")
                    .font(Font.custom("Arial Rounded MT Bold", size: 17))
                    .padding(.bottom, 30)
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 25) {
                        ForEach(popularTVShowsViewModel.popularTVShows) { tvShow in
                            NavigationLink(
                                destination: TVShowDetailView(mock: mock ?? false, tvShowId: tvShow.id),
                                label: { PopularTvShowsItemView(tvShow: tvShow) })
                        }
                    }
                    .onAppear {
                        popularTVShowsViewModel.getPopularTVShows(mock: mock ?? false)
                    }
                }
            }
            .padding(20)
            .navigationBarHidden(true)
        }
    }
}

struct PopularTVShowsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularTVShowsView(mock: true)
    }
}
