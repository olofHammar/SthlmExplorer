//
//  View+Frame.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-13.
//

import SwiftUI

extension View {
    @inlinable public func height(_ value: CGFloat?, alignment: Alignment = .center) -> some View {
        self.frame(height: value, alignment: alignment)
    }

    @inlinable public func width(_ value: CGFloat?, alignment: Alignment = .center) -> some View {
        self.frame(width: value, alignment: alignment)
    }

    @inlinable public func maxHeight(_ value: CGFloat?, alignment: Alignment = .center) -> some View {
        self.frame(maxHeight: value, alignment: alignment)
    }

    @inlinable public func maxWidth(_ value: CGFloat?, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: value, alignment: alignment)
    }

}

extension View {
    /// Wraps view inside `AnyView`
    func embedInAnyView() -> AnyView {
        AnyView(self)
    }

    /// Wraps view inside `AnyView`
    func eraseToAnyView() -> AnyView { embedInAnyView() }

    /// Wraps view inside `NavigationView`
    func embedInNavigation() -> some View {
        NavigationView { self }
    }
}
