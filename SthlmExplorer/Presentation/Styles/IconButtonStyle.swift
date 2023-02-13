//
//  IconButtonStyle.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import SwiftUI

struct IconButtonStyle: ButtonStyle {

    let image: Image
    var foreground: Color = Asset.Colors.Main.accent.swiftUIColor
    var background: Color = Asset.Colors.Background.b200.swiftUIColor

    func makeBody(configuration: Configuration) -> some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: .x4, height: .x4)
            .foregroundColor(foreground)
            .padding(8)
            .background(background)
            .clipShape(Circle())
            .shadow(color: Color.white, radius: 1, x: -1, y: -1)
            .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
    }
}

struct IconButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button(String.empty, action: {})
                .buttonStyle(IconButtonStyle(image: Asset.Images.Icons.magnifyingglass.swiftUIImage))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Asset.Colors.Background.b200.swiftUIColor)
        .ignoresSafeArea()
    }
}
