//
//  IconButtonStyle.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import SwiftUI

struct IconButtonStyle: ButtonStyle {

    let systemImage: String
    var foreground: Color = Asset.Colors.Main.accent.swiftUIColor
    var background: Color = Asset.Colors.Background.b100.swiftUIColor

    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: systemImage)
            .foregroundColor(Asset.Colors.Main.accent.swiftUIColor)
            .font(.system(size: 20))
            .frame(width: 40, height: 40)
            .background(.thickMaterial)
            .clipShape(Circle())
            .shadow(color: Color.white, radius: 1, x: -1, y: -1)
            .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
    }
}

struct IconButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button(String.empty, action: {})
                .buttonStyle(IconButtonStyle(systemImage: "magnifyingglass"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Asset.Colors.Background.b100.swiftUIColor)
        .ignoresSafeArea()
    }
}
