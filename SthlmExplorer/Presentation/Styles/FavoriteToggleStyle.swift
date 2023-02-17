//
//  FavoriteToggleStyle.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import SwiftUI

struct FavoriteToggleStyle: ToggleStyle {

    @State var tapped = false
    @State var isFavorite: Bool

    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            Image(systemImage: configuration.isOn ? .heartFill : .heart)
                .font(.system(size: 20))
                .frame(width: .defaultIconHeight, height: .defaultIconHeight)
                .foregroundColor(Asset.Colors.Main.accent.swiftUIColor)
                .background(.thickMaterial)
                .colorScheme(.light)
                .clipShape(Circle())
                .shadow(color: Color.white, radius: 1, x: -1, y: -1)
                .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
                .scaleEffect(tapped ? 1.2 : 1.0)
                .onTapGesture {
                    configuration.isOn.toggle()
                    withAnimation(.easeOut(duration: 0.1)) {
                        tapped.toggle()
                    }
                    withAnimation(.easeOut(duration: 0.1).delay(0.4)) {
                        tapped.toggle()
                    }
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
