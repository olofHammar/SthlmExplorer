//
//  RemoteImageViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-13.
//

import SwiftUI

/// A model object that manages the loading and caching of images from remote URLs.
final class RemoteImageViewModel: ObservableObject {

    /// The loaded image, if anvailable.
    @Published var image: UIImage?

    /// The URL string of the image to be loaded.
    var urlString: String?

    /// The cache for loaded images.
    var imageCache = RemoteImageCache.getImageCache()

    /// Initializes the model object and begins loading the image.
    /// - Parameter urlString: The URL string of the image to be loaded.
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }

    /// Loads the image from cache if available, or from the URL if not.
    func loadImage() {
        if loadImageFromCache() {
            return
        }

        loadImageFromUrl()
    }

    /// Attempts to load the image from cache.
    /// - Returns: `true` if the image was loaded from cache, otherwise `false`.
    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }

        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }

        image = cacheImage
        return true
    }

    /// Loads the image from the specified URL.
    func loadImageFromUrl() {
        guard let urlString = urlString else {
            return
        }

        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }

    /// Handles the response from the URL session.
    /// - Parameters:
    ///   - data: The data returned from the URL session.
    ///   - response: The response object returned from the URL session.
    ///   - error: The error returned from the URL session.
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            return
        }
        guard let data = data else {
            return
        }

        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }

            self.imageCache.set(forKey: self.urlString!, image: loadedImage)
            self.image = loadedImage
        }
    }
}

/// A cache for remote images.
class RemoteImageCache {
    /// The cache for remote images.
    var cache = NSCache<NSString, UIImage>()

    /// Returns the cached image for the specified key, if any.
    /// - Parameter forKey: The key for the image.
    /// - Returns: The cached image for the key, if any.
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }

    /// Caches the specified image for the specified key.
    /// - Parameters:
    ///   - forKey: The key for the image.
    ///   - image: The image to be cached.
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension RemoteImageCache {
    /// The shared instance of the remote image cache.
    private static var imageCache = RemoteImageCache()

    /// Returns the shared instance of the remote image cache.
    /// - Returns: The shared instance of the remote image cache.
    static func getImageCache() -> RemoteImageCache {
        return imageCache
    }
}
