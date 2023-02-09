//
//  View+TextStyle.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-09.
//

import SwiftUI

enum TextStyle {
    case headerOne, headerTwo, headerThree, headerFour
    case headerOnePlay, headerTwoPlay, headerThreePlay, headerFourPlay
    case bodyL, bodyM, bodyS, bodyXS, bodyLPlay, bodyMPlay
    case bodyLSemiBold, bodyMSemiBold, bodySSemiBold, bodyXSSemiBold
    case bodyLBold, bodyMBold, bodySBold, bodyXSBold, bodyLBoldPlay, bodyMBoldPlay, bodySBoldPlay

    fileprivate var font: FontConvertible {
        switch self {
        case .headerOnePlay, .headerTwoPlay, .headerThreePlay, .bodyLBoldPlay, .bodyMBoldPlay, .bodySBoldPlay:
            return FontFamily.PlayfairDisplay.bold
        case .headerFourPlay, .bodyLPlay, .bodyMPlay:
            return FontFamily.PlayfairDisplay.regular
        case .headerOne, .headerTwo, .headerThree:
            return FontFamily.JosefinSans.bold
        case .headerFour, .bodyL, .bodyM, .bodyS, .bodyXS:
            return FontFamily.JosefinSans.regular
        case .bodyLSemiBold, .bodyMSemiBold, .bodySSemiBold, .bodyXSSemiBold:
            return FontFamily.JosefinSans.semiBold
        case .bodyLBold, .bodyMBold, .bodySBold, .bodyXSBold:
            return FontFamily.JosefinSans.bold
        }
    }

    fileprivate var size: CGFloat {
        switch self {
        case .headerOne, .headerOnePlay: return 48
        case .headerFour, .headerTwo, .headerFourPlay, .headerTwoPlay: return 32
        case .headerThree, .headerThreePlay: return 24
        case .bodyL, .bodyLSemiBold, .bodyLBold, .bodyLPlay, .bodyLBoldPlay: return 16
        case .bodyM, .bodyMSemiBold, .bodyMBold, .bodyMPlay, .bodyMBoldPlay: return 14
        case .bodyS, .bodySSemiBold, .bodySBold, .bodySBoldPlay: return 12
        case .bodyXS, .bodyXSSemiBold, .bodyXSBold: return 10
        }
    }

    fileprivate var lineHeightMultiplier: CGFloat {
        switch self {
        case .bodyXS, .bodyXSSemiBold, .bodyXSBold: return 1
        case .bodyS, .bodySSemiBold, .bodySBold, .bodySBoldPlay: return 1.5
        case .bodyM, .bodyMSemiBold, .bodyMBold, .bodyL, .bodyLSemiBold, .bodyLBold, .headerOne, .headerTwo, .headerThree, .headerFour, .headerOnePlay, .headerTwoPlay, .headerThreePlay, .headerFourPlay, .bodyLPlay, .bodyLBoldPlay, .bodyMPlay, .bodyMBoldPlay: return 1.4
        }
    }

    fileprivate var inherentLineHeightOfFont: CGFloat {
        UIFont(font: self.font, size: self.size)?.lineHeight ?? self.size
    }

    fileprivate var lineHeight: CGFloat {
        self.size * self.lineHeightMultiplier - self.inherentLineHeightOfFont
    }
}


extension View {
    func textStyle(_ textStyle: TextStyle) -> some View {
        return self.font(textStyle.font.just(size: textStyle.size))
            .lineSpacing(textStyle.lineHeight)
    }
}


extension NavigationView {
    func navigationBarTitleStyleInline(_ textStyle: TextStyle) -> some View {
        UINavigationBar.appearance().titleTextAttributes = [
            .font: UIFont(font: textStyle.font, size: textStyle.size) ?? .systemFont(ofSize: textStyle.size)
        ]
        return self
    }
}
