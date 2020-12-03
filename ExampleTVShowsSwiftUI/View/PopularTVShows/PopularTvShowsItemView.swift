//
//  PopularTvShowsItemView.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 14/11/2020.
//

import SwiftUI

struct PopularTvShowsItemView: View {
    @StateObject var getNetworkImage = GetNetworkImageViewModel()

    let tvShow: TVShow
    
    var body: some View {
        VStack {
            if let coverImage = getNetworkImage.thumbnailImage {
                coverImage
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
                    .shadow(color: .black, radius: 2, x: 2, y: 0.0)
            } else {
                PopularTvShowsItemView.coverPlaceholder()
            }
            Spacer()
                .frame(height: 15)
            if let tvShowName = tvShow.name {
                Text("\(tvShowName)")
                    .modifier(TvShowNameStyle())
            }
            Spacer()
        }
        .padding(5)
        .onAppear {
            if let thumbnailImageUrl = tvShow.getCompleteThumbnailPosterPath() {
                getNetworkImage.getThumbnailImage(url: thumbnailImageUrl)
            }
        }
    }
    
    static func coverPlaceholder() -> some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(0.67, contentMode: .fit)
            .shadow(color: .black, radius: 2, x: 2, y: 0.0)
            .overlay(Image(systemName: "film")
                        .foregroundColor(.gray))
    }
}

struct TvShowNameStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(Font.custom("Arial Rounded MT Bold", size: 12))
            .foregroundColor(Color.init(UIColor.darkGray))
            .multilineTextAlignment(.center)
    }
}

struct PopularTvShowsItemView_Previews: PreviewProvider {
    static var previews: some View {
        PopularTvShowsItemView(tvShow: DataTestModel.TVShowTest)
    }
}
