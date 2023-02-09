//
//  FontConvertible+Extension.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-09.
//

import SwiftUI

extension FontConvertible {
    func just(size: CGFloat) -> SwiftUI.Font {
        return SwiftUI.Font(self.font(size: size) as CTFont)
    }
}
