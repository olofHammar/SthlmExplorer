//
//  RemoteImageView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-13.
//

import SwiftUI

///  A view for displaying an image loaded from a remote URL.
struct RemoteImageView: View {
    /// The observed object that manages the loading of the image from the specified URL.
    @ObservedObject var urlImageModel: RemoteImageViewModel

    /// The content mode of the image.
    let contentMode: ContentMode

    /// A Boolean value that indicates whether the image should be rendered as its original color.
    let renderAsOriginal: Bool

    /// A view to be displayed while the image is being loaded.
    let placeholder: AnyView

    /// Creates a new remote image view.
    /// - Parameters:
    ///   - urlString: The URL string of the image to be loaded.
    ///   - contentMode: The content mode of the image. Default is `.fill`.
    ///   - renderAsOriginal: A `Boolean` value that indicates whether the image should be rendered as its original color. Default is `true`.
    ///   - placeholder: A view to be displayed while the image is being loaded. Default is an empty `Color` view.
    init(urlString: String?,
         contentMode: ContentMode = .fill,
         renderAsOriginal: Bool = true,
         placeholder: AnyView = Color.clear.embedInAnyView()) {

        urlImageModel = RemoteImageViewModel(urlString: urlString)
        self.contentMode = contentMode
        self.renderAsOriginal = renderAsOriginal
        self.placeholder = placeholder
    }

    var body: some View {
        if let image = urlImageModel.image {
            Image(uiImage: image)
                .resizable()
                .renderingMode(renderAsOriginal ? .original : .template)
                .aspectRatio(contentMode: contentMode)
        } else {
            placeholder
        }
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView(urlString: nil,
                        placeholder: Asset.Colors.Main.gray100.swiftUIColor.embedInAnyView()
        )
    }
}
