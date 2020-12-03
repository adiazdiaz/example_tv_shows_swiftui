//
//  NetworkManager.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 22/11/20.
//

import Foundation

protocol NetworkManagerProtocol {
    func buildRequest(endPoint: APITheMovieDB) -> URLRequest?
}

final class NetworkManager: NetworkManagerProtocol {
    
    static let environment: NetworkEnvironment = .production
    
    func buildRequest(endPoint: APITheMovieDB) -> URLRequest? {
        guard let url = URL(string: "\(endPoint.baseURL)\(endPoint.path)") else { return nil }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        try? URLParameterEncoder.encode(urlRequest: &request, with: ["api_key" : endPoint.APIKey])
        request.httpMethod = endPoint.httpMethod.rawValue
        return request
    }
}
