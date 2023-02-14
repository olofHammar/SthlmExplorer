//
//  ListOffsetModifier.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-13.
//

import SwiftUI

struct ListOffsetModifier: ViewModifier {
    @Binding var offset: CGFloat
    @State private var startOffset: CGFloat = .zero

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: ListOffsetKey.self, value: proxy.frame(in: .global).minY)
                }
            )
            .onPreferenceChange(ListOffsetKey.self) { offset in
                if startOffset == .zero {
                    startOffset = offset
                }
                self.offset = offset - startOffset
            }
    }
}

struct ListOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
