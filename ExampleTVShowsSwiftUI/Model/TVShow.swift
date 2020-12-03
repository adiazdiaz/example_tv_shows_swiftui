//
//  TVShow.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 14/11/2020.
//

import Foundation

struct TVShow: Codable, Identifiable {
    let id: Int
    let name: String?
    let posterPath: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
    }
    
    func getCompleteThumbnailPosterPath() -> URL? {
        URL(string: "\(Bundle.main.theMovieDbImagesPathThumbnail)\(posterPath ?? "")")
    }
    
}
