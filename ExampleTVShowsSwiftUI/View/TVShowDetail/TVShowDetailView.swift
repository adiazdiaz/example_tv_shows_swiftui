//
//  TVShowDetailView.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 22/11/20.
//

import SwiftUI

struct TVShowDetailView: View {
    let mock: Bool
    let tvShowId: Int
    
    @StateObject var tvShowDetailViewModel = TVShowDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: -30) {
                if let tvShowDetail = tvShowDetailViewModel.tvShowDetail {
                    TVShowDetailCoverView(tvShowCoverImageUrl: tvShowDetail.getCompletePosterPath())
                    VStack(alignment: .leading, spacing: 30) {
                        Text("\(tvShowDetail.name ?? "")")
                            .font(Font.custom("Arial Rounded MT Bold", size: 32))
                            .padding(.horizontal, 20)
                        Text("\(tvShowDetail.overview ?? "")")
                            .font(Font.custom("Arial", size: 18))
                            .foregroundColor(Color(UIColor.darkGray))
                            .padding(.horizontal, 20)
                    }
                    .padding(.vertical, 30)
                    .background(
                        RoundedRectangle(cornerRadius: 16).fill(Color.white)
                    )
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            tvShowDetailViewModel.getTVShowDetail(tvShowId: tvShowId, mock: mock)
        }
    }
}

struct TVShowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailView(mock: true, tvShowId: DataTestModel.TVShowDetailTest.id)
    }
}
