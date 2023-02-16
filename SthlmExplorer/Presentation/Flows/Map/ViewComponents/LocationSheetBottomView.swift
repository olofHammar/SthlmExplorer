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
            Button {
                onExpand?()
            } label: {
                Text(MyStrings.readMore)
            }

            Spacer()

            Button {
                onDismiss?()
            } label: {
                Text(MyStrings.close)
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
