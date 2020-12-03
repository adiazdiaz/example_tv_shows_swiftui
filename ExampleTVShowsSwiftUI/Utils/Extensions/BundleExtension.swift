//
//  BundleExtension.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 14/11/2020.
//

import Foundation

//MARK:- Extension Bundle
extension Bundle {
    
    var theMovieDbAPIKey: String { object(forInfoDictionaryKey: "TheMovieDbAPIKey") as? String ?? "" }
    
    var theMovieDbImagesPathThumbnail: String { object(forInfoDictionaryKey: "TheMovieDbImagesPathThumbnail") as? String ?? "" }
    
    var theMovieDbImagesPath: String { object(forInfoDictionaryKey: "TheMovieDbImagesPath") as? String ?? "" }
}
