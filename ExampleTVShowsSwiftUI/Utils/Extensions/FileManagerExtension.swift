//
//  FileManagerExtension.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 1/12/20.
//

import Foundation

extension FileManager {
    static func sharedContainer() -> URL { FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] }
}
