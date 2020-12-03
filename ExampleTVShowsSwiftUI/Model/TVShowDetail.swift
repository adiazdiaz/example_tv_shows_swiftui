//
//  TVShowDetail.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 14/11/2020.
//

import Foundation

struct TVShowDetail: Codable {
    let id: Int
    let name: String?
    let posterPath: String?
    let overview: String?

    enum CodingKeys: String, CodingKey {
        case id, name, overview
        case posterPath = "poster_path"
    }
    
    func getCompletePosterPath() -> URL? { URL(string: "\(Bundle.main.theMovieDbImagesPath)\(posterPath ?? "")") }
}
