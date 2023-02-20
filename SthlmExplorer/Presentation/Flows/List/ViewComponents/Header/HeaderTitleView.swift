//
//  HeaderTitleView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-13.
//

import Model
import SwiftUI

struct HeaderTitleView: View {

    let locationFilter: LocationFilter
    let animation: Namespace.ID

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()

            ForEach(LocationFilter.allCases, id: \.self) { filter in
                VStack(alignment: .leading, spacing: 0) {
                    Text(filter.headerCaption)
                        .textStyle(.headerFourPlay)
                        .foregroundColor(Asset.Colors.Main.gray200.swiftUIColor)
                        .padding(.bottom, -.x1)

                    Text(filter.headerTitle)
                        .textStyle(.headerOnePlay)
                        .foregroundColor(Asset.Colors.Main.black200.swiftUIColor)
                }
            }
        }
        .matchedGeometryEffect(id: String.headerTitleID, in: animation)
        .allowsHitTesting(false)
        .offset(y: contentOffset())
        .frame(height: .headerTitleHeight, alignment: .top)
        .clipped()
    }

    private func contentOffset() -> CGFloat {
        switch locationFilter {
        case .all: return 0
        case .landmarks: return -.headerTitleHeight
        case .scenicViews: return -.headerTitleHeight * 2
        case .museums: return -.headerTitleHeight * 3
        case .favorites: return -.headerTitleHeight * 4
        }
    }
}

struct HeaderTitleView_Previews: PreviewProvider {
    @Namespace static var animation

    static var previews: some View {
        HeaderTitleView(locationFilter: .favorites, animation: animation)
    }
}
