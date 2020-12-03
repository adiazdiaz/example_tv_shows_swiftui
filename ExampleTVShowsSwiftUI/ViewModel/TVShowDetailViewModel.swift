//
//  TVShowDetailViewModel.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 22/11/20.
//

import SwiftUI
import Combine

final class TVShowDetailViewModel: ObservableObject {
    @Published var tvShowDetail: TVShowDetail?
    
    var subscribers = Set<AnyCancellable>()
    
    func getTVShowDetail(tvShowId: Int, mock: Bool) {
        mock ? mockTVShowDetail() : getTVShowDetail(tvShowId: tvShowId)
    }
    
    func getTVShowDetail(tvShowId: Int) {
        let networkManager = NetworkManager()
        if let request = networkManager.buildRequest(endPoint: .getTVShowDetail(tvShowId: tvShowId)) {
            URLSession.shared
                .dataTaskPublisher(for: request)
                .map { $0.data }
                .decode(type: TVShowDetail.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Error in getTVShowDetail: \(error)")
                    }
                }, receiveValue: { tvShowDetail in
                    self.tvShowDetail = tvShowDetail
                })
                .store(in: &subscribers)
        }
    }
    
    func mockTVShowDetail() { tvShowDetail = DataTestModel.TVShowDetailTest }
}
