//
//  RoundedCardModifier.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import SwiftUI

struct RoundedCardModifier: ViewModifier {
    let cornerRadius: CGFloat
    let shadowRadius: CGFloat
    let backgroundColor: Color

    init(
        cornerRadius: CGFloat = .x2,
        shadowRadius: CGFloat = 1,
        backgroundColor: Color = Asset.Colors.Background.b100.swiftUIColor
    ) {
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.backgroundColor = backgroundColor
    }

    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(color: Color.white, radius: shadowRadius, x: -1, y: -1)
            .shadow(color: Color.gray, radius: shadowRadius, x: 1, y: 1)
    }
}

struct RoundedCardModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Example card")
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .modifier(RoundedCardModifier())
    }
}
