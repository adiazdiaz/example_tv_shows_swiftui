//
//  TVShowsResponse.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 14/11/2020.
//

import Foundation

struct TVShowsResponse: Codable {
    let page: Int?
    let results: [TVShow]
    let totalResults: Int?
    let totalPages: Int?
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
