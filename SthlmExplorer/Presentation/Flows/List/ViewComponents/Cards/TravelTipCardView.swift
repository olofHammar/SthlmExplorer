//
//  TravelTipCardView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Model
import SwiftUI

struct TravelTipCardView: View {

    let travelTip: TravelTipItem
    private typealias Strings = L10n.TravelTipCard

    var body: some View {
        ZStack {
            thumbsUpView()
                .frame(maxHeight: .infinity, alignment: .top)
                .padding([.leading, .top], .x2)

            VStack(spacing: 0) {
                Spacer()

                centerTextSectionView()

                Spacer()

                leadingBottomText()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: .x2, y: -.x2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: 250)
        .foregroundColor(Asset.Colors.Main.accent.swiftUIColor)
        .modifier(RoundedCardModifier())
    }

    @ViewBuilder
    private func thumbsUpView() -> some View {
        HStack {
            Spacer()

            Asset.Images.SketchImages.thumbUp.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .x6, height: .x6)
                .foregroundColor(Asset.Colors.Main.accent.swiftUIColor)
        }
    }

    @ViewBuilder
    private func centerTextSectionView() -> some View {
        VStack(spacing: .x1) {
            Text(travelTip.title.uppercased())
                .textStyle(.bodyLBold)

            Text(travelTip.caption)
                .textStyle(.bodyMBoldPlay)
        }
        .multilineTextAlignment(.center)
        .frame(width: 250)
    }

    @ViewBuilder
    private func leadingBottomText() -> some View {
        Text(Strings.title.uppercased())
            .textStyle(.bodySBold)
            .foregroundColor(Asset.Colors.Main.gray200.swiftUIColor)
    }
}

struct TravelTipCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TravelTipCardView(travelTip: TravelTipItem(
                id: "",
                title: "Many museums have free entrance",
                caption: "Since 2016, state museums in Sweden have free admission.",
                order: 1
            ))
        }
    }
}
