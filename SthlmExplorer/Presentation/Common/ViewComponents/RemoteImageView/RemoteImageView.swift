//
//  RemoteImageView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-13.
//

import SwiftUI

struct RemoteImageView: View {
    @ObservedObject var urlImageModel: RemoteImageViewModel

    let contentMode: ContentMode
    let renderAsOriginal: Bool
    let placeholder: AnyView

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
