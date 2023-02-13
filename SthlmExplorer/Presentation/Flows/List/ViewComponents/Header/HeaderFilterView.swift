//
//  HeaderFilterView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-13.
//

import Model
import SwiftUI

struct HeaderFilterView: View {

    @Binding var selectedFilter: LocationFilter
    let animation: Namespace.ID

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .x2) {
                ForEach(LocationFilter.allCases, id: \.self) { locationFilter in
                    filterButton(locationFilter: locationFilter)
                }
            }
            .frame(height: .x7)
        }
        .frame(maxHeight: . infinity, alignment: .bottom)
        .padding([.top, .horizontal], .x2)
    }

    @ViewBuilder
    private func filterButton(locationFilter: LocationFilter) -> some View {
        Button(action: {
            withAnimation {
                selectedFilter = locationFilter
            }
        }, label: {
            VStack(spacing: 0) {
                Text(locationFilter.title)
                    .textStyle(isSelected(locationFilter) ? .bodyMBold : .bodyM)
                    .foregroundColor(isSelected(locationFilter) ?
                                     Asset.Colors.Main.accent.swiftUIColor : Asset.Colors.Main.gray200.swiftUIColor)

                ZStack {
                    Rectangle()
                        .fill(.clear)
                        .frame(height: .x05)

                    if isSelected(locationFilter) {
                        Asset.Images.SketchImages.underline.swiftUIImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: String.filterTabID, in: animation)
                            .frame(height: .x1)
                            .frame(maxWidth: .x5)
                            .foregroundColor(Asset.Colors.Main.accent.swiftUIColor)
                    } else {
                        Rectangle()
                            .fill(.clear)
                            .frame(height: .x1)
                    }
                }
            }
        })
        .buttonStyle(PlainButtonStyle())
    }

    private func isSelected(_ filter: LocationFilter) -> Bool {
        filter == selectedFilter
    }
}

struct HeaderFilterView_Previews: PreviewProvider {
    @Namespace static var animation

    static var previews: some View {
        HeaderFilterView(selectedFilter: .constant(.landmarks), animation: animation)
    }
}
