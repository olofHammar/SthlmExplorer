//
//  LocationSheetBottomView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-16.
//

import SwiftUI

struct LocationSheetBottomView: View {

    var onExpand: (() -> Void)?
    var onDismiss: (() -> Void)?

    private typealias MyStrings = L10n.MapSheet.Info

    var body: some View {
        HStack {
            Button(MyStrings.readMore) {
                onExpand?()
            }

            Spacer()

            Button(MyStrings.close) {
                onDismiss?()
            }
        }
        .textStyle(.bodyM)
        .foregroundColor(Asset.Colors.Main.secondary.swiftUIColor)
    }
}

struct LocationSheetBottomView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSheetBottomView(onExpand: {}, onDismiss: {})
    }
}
