//
//  RoundedCardModifier.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import SwiftUI

/// A view modifier that adds a rounded rectangle background and a shadow to the view.
struct RoundedCardModifier: ViewModifier {
    /// The corner radius of the rounded rectangle.
    let cornerRadius: CGFloat

    /// The radius of the shadow.
    let shadowRadius: CGFloat

    /// The background color of the card.
    let backgroundColor: Color

    /// Creates a new rounded card modifier.
    /// - Parameters:
    ///   - cornerRadius: The corner radius of the rounded rectangle. Default is `.x2`.
    ///   - shadowRadius: The radius of the shadow. Default is `1`.
    ///   - backgroundColor: The background color of the card. Default is `Asset.Colors.Background.b100.swiftUIColor`.
    init(
        cornerRadius: CGFloat = .x2,
        shadowRadius: CGFloat = 1,
        backgroundColor: Color = Asset.Colors.Background.b100.swiftUIColor
    ) {
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.backgroundColor = backgroundColor
    }

    /// Returns a new view with a rounded rectangle background and a shadow.
    /// - Parameter content: The content of the view.
    /// - Returns: A new view with a rounded rectangle background and a shadow.
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
