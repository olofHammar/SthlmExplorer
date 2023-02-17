//
//  ListOffsetModifier.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-13.
//

import SwiftUI

/// A modifier that provides the offset of a `List` in a binding variable.
/// This modifier is used to obtain the current scroll position of a `List` and stores it in a binding variable. The offset value represents the position of the top edge of the `List` relative to its parent view.
struct ListOffsetModifier: ViewModifier {
    /// The binding variable to store the offset value.
    @Binding var offset: CGFloat

    /// The initial offset value when the `List` is first rendered.
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
