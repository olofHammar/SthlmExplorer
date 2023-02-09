//
//  Assets+Extension.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-09.
//

import Foundation
import SwiftUI

extension Image {
    init(_ asset: ImageAsset) {
        self.init(asset.name)
    }
}

extension ImageAsset {
    func just() -> SwiftUI.Image {
        SwiftUI.Image(self)
    }
}

extension Color {
    init(_ asset: ColorAsset) {
        self.init(asset.name)
    }
}

extension ColorAsset {
    func just() -> SwiftUI.Color {
        SwiftUI.Color(self)
    }
}
