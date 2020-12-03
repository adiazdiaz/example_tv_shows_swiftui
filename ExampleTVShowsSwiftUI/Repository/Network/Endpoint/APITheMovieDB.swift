//
//  APITheMovieDB.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 22/11/20.
//

import Foundation

enum NetworkEnvironment {
    case production
    //case qa, test, pre
}

enum APITheMovieDB {
    case getPopularTVShows(page: Int)
    case getTVShowDetail(tvShowId: Int)
}

protocol EndPoint {
    var APIKey: String { get }
    var baseURL: String { get }
    var path: String { get }
}

extension APITheMovieDB: EndPoint {
    
    var APIKey: String { Bundle.main.theMovieDbAPIKey }
    
    var baseURL: String {
        switch NetworkManager.environment {
            case .production: return "https://api.themoviedb.org/3/tv"
        }
    }
    
    var path: String {
        switch self {
            case .getPopularTVShows(_): return "/popular"
            case .getTVShowDetail(let tvShowId): return "/\(tvShowId)"
        }
    }
    
    var httpMethod: HTTPMethod { return .get }
}
