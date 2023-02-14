//
//  FavoriteToggleStyle.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import SwiftUI

struct FavoriteToggleStyle: ToggleStyle {

    @State var tapped = false
    @State var splash = false
    @State var isFavorite: Bool

    private var animationScale: CGFloat {
        isFavorite ? 1.2 : 0.7
    }

    private var splashScale: CGFloat {
        tapped ? 1.3 : 0.7
    }

    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            Image(systemImage: configuration.isOn ? .heartFill : .heart)
                .foregroundColor(Asset.Colors.Main.accent.swiftUIColor)
                .overlay(content: {
                    Image(systemImage: configuration.isOn ? .heartFill : .heart)
                        .foregroundColor(Asset.Colors.Main.accent.swiftUIColor)
                        .animation(splash ? .easeInOut(duration: 0.5).repeatForever(autoreverses: true) : .default, value: splash)
                        .scaleEffect(splash ? splashScale : 1)
                        .opacity(isFavorite ? 1 : 0)
                })
                .font(.system(size: 20))
                .frame(width: .defaultIconHeight, height: .defaultIconHeight)
                .background(.thickMaterial)
                .clipShape(Circle())
                .shadow(color: Color.white, radius: 1, x: -1, y: -1)
                .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
                .scaleEffect(tapped ? animationScale : 1)
        }
        .onTapGesture {
            configuration.isOn.toggle()
            withAnimation(.easeOut(duration: 0.1)) {
                tapped.toggle()
                splash.toggle()
                isFavorite.toggle()
            }
            withAnimation(.easeOut(duration: 0.1).delay(0.4)) {
                tapped.toggle()
                splash.toggle()
            }
        }
    }
}

struct FavoriteToggleStyle_Previews: PreviewProvider {
    struct Preview: View {
        @State var isOn = false

        var body: some View {
            Toggle("", isOn: $isOn)
                .toggleStyle(FavoriteToggleStyle(isFavorite: false))
        }
    }

    static var previews: some View {
        Preview()
    }
}
