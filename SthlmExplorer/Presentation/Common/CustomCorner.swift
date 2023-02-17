//
//  CustomCorner.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-12.
//

import SwiftUI

/// A shape that represents a rounded rectangle with specific corners.
struct CustomCorner: Shape {
    /// The corners of the rectangle that should be rounded.
    var corners: UIRectCorner

    /// The radius of the rounded corners.
    var radius: CGFloat

    /// Returns a `Path` representing the rounded rectangle.
    /// - Parameter rect: The rectangle to be rounded.
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        return Path(path.cgPath)
    }
}
