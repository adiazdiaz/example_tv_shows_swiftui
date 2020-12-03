//
//  GetNetworkImageViewModel.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 1/12/20.
//

import SwiftUI
import Combine

final class GetNetworkImageViewModel: ObservableObject {
    @Published var thumbnailImage: Image?
    @Published var largeImage: Image?
    
    var subscribers = Set<AnyCancellable>()
    
    func getThumbnailImage(url: URL) {
        guard let filePath = path(url: url, suffix: "_thumb") else { return }
        
        getNetworkImage(url: url, path: filePath, callBack: { image in
            self.thumbnailImage = image
        })
    }
    
    func getLargeImage(url: URL) {
        guard let filePath = path(url: url, suffix: "_large") else { return }
        
        getNetworkImage(url: url, path: filePath, callBack: { image in
            self.largeImage = image
        })
    }
    
    func path(url: URL, suffix: String) -> URL? {
        let cacheUrl = FileManager.sharedContainer()
        return cacheUrl.appendingPathComponent("\(url.lastPathComponent.replacingOccurrences(of: ".jpg", with: ""))\(suffix)").appendingPathExtension("jpg")
    }
    
    func getNetworkImage(url: URL, path: URL, callBack: @escaping (Image) -> Void) {
        if FileManager.default.fileExists(atPath: path.path) {
            if let imageData = try? Data(contentsOf: path),
               let uiImage = UIImage(data: imageData) {
                callBack(Image(uiImage: uiImage))
                return
            }
        }
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .compactMap { UIImage(data: $0) }
            .tryMap {
                try $0.jpegData(compressionQuality: 1)?.write(to: path, options: [.atomicWrite, .completeFileProtection])
                return $0
            }
            .map { Image(uiImage: $0) }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error \(error) to download the image \(url.absoluteString)")
                }
            }, receiveValue: callBack)
            .store(in: &subscribers)
    }
}
