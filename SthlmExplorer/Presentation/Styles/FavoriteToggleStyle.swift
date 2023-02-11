//
//  FavoriteToggleStyle.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import SwiftUI

struct FavoriteToggleStyle: ToggleStyle {

    @State var tapped = false

    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ? "heart.fill" : "heart")
            .font(.system(size: 20))
            .frame(width: 40, height: 40)
            .background(.thickMaterial)
            .clipShape(Circle())
            .colorScheme(.dark)
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

struct FavoriteToggleStyle_Previews: PreviewProvider {
    struct Preview: View {
        @State var isOn = false

        var body: some View {
            Toggle("", isOn: $isOn)
                .toggleStyle(FavoriteToggleStyle())
        }
    }

    static var previews: some View {
        Preview()
    }
}

