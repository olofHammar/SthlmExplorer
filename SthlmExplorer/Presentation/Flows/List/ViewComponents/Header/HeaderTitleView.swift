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
    let contentHeight: CGFloat = 90

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()

            ForEach(LocationFilter.allCases, id: \.self) { filter in
                VStack(alignment: .leading, spacing: 0) {
                    Text(filter.headerCaption)
                        .textStyle(.headerFourPlay)
                        .foregroundColor(.gray)
                        .padding(.bottom, -.x1)

                    Text(filter.headerTitle)
                        .textStyle(.headerOnePlay)
                        .foregroundColor(Asset.Colors.Main.black200.swiftUIColor)
                }
            }
        }
        .matchedGeometryEffect(id: String.headerTitleID, in: animation)
        .offset(y: contentOffset())
        .frame(height: contentHeight, alignment: .top)
        .clipped()
    }

    private func contentOffset() -> CGFloat {
        switch locationFilter {
        case .all: return 0
        case .landmarks: return -contentHeight
        case .scenicViews: return -contentHeight * 2
        case .museums: return -contentHeight * 3
        case .favorites: return -contentHeight * 4
        }
    }
}

struct HeaderTitleView_Previews: PreviewProvider {
    @Namespace static var animation

    static var previews: some View {
        HeaderTitleView(locationFilter: .favorites, animation: animation)
    }
}
