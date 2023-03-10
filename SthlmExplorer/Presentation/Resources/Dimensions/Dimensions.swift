//
//  Dimensions.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-09.
//

import UIKit

extension CGFloat {
    static let zero = 0

    // MARK: - Default values
    static var defaultContentWidth: CGFloat = 300
    static var largeContentWidth: CGFloat = 340
    static var expandedHeaderHeight: CGFloat = 220
    static var compressedHeaderHeight: CGFloat = 160
    static var headerTitleHeight: CGFloat = 90
    static var headerFilterHeight: CGFloat { .x7 }
    static var defaultCardHeight: CGFloat = 250
    static var defaultIconHeight: CGFloat = 40

    // MARK: - Padding
    static var defaultHorizontalPadding: CGFloat { .x2 }
    static var defaultVerticalPadding: CGFloat { .x2 }

    static var horizontalNavTitlePadding: CGFloat = .x1 * 2.5

    static var x05: CGFloat = x1 / 2

    static var x1: CGFloat = 8
    static var x2: CGFloat = x1 * 2
    static var x3: CGFloat = x1 * 3
    static var x4: CGFloat = x1 * 4
    static var x5: CGFloat = x1 * 5

    static var x6: CGFloat = x1 * 6
    static var x7: CGFloat = x1 * 7

    static var x8: CGFloat = x2 * 4
    static var x9: CGFloat = x3 * 3
    static var x10: CGFloat = x2 * 5
    static var x12: CGFloat = x3 * 6
    static var x14: CGFloat = x4 * 7
    static var x15: CGFloat = x4 * 8
    static var x16: CGFloat = x5 * 8
}
