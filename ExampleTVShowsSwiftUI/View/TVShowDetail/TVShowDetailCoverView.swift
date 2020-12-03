//
//  TVShowDetailCoverView.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 3/12/20.
//

import SwiftUI

struct TVShowDetailCoverView: View {
    let tvShowCoverImageUrl: URL?
    
    @StateObject var getNetworkImageViewModel = GetNetworkImageViewModel()
    
    var body: some View {
        VStack {
            if let coverImage = getNetworkImageViewModel.largeImage {
                coverImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                TVShowDetailCoverView.coverPlaceholder()
            }
        }.onAppear {
            guard let tvShowCoverImageUrl = tvShowCoverImageUrl else { return }
            getNetworkImageViewModel.getLargeImage(url: tvShowCoverImageUrl)
        }
    }
    
    static func coverPlaceholder() -> some View {
        Rectangle()
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(0.67, contentMode: .fit)
            .overlay(Image(systemName: "film")
                        .foregroundColor(.gray))
    }
}

struct TVShowDetailCoverView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailCoverView(tvShowCoverImageUrl: DataTestModel.TVShowDetailTest.getCompletePosterPath())
    }
}
