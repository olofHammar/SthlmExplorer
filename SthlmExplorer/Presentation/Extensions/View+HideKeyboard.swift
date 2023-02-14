//
//  View+HideKeyboard.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-14.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
