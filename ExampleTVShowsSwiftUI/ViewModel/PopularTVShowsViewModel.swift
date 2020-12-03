//
//  PopularTVShowsViewModel.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 22/11/20.
//

import Foundation
import Combine

final class PopularTVShowsViewModel: ObservableObject {
    @Published var popularTVShows: [TVShow] = []
    
    var subscribers = Set<AnyCancellable>()
    
    func getPopularTVShows(mock: Bool) {
        mock ? mockPopularTVShows() : getPopularTVShows()
    }
    
    func getPopularTVShows() {
        let networkManager = NetworkManager()
        if let request = networkManager.buildRequest(endPoint: .getPopularTVShows(page: 1)) {
            URLSession.shared
                .dataTaskPublisher(for: request)
                .map { $0.data }
                .decode(type: TVShowsResponse.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Error in getPopularTVShows: \(error)")
                    }
                }, receiveValue: { tvShowsResponse in
                    self.popularTVShows = tvShowsResponse.results
                })
                .store(in: &subscribers)
        }
    }
    
    func mockPopularTVShows() { popularTVShows = DataTestModel.TVShowsResponseTest.results }
}
