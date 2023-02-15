//
//  LocationDetailView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-14.
//

import Model
import SwiftUI

struct LocationDetailView: View {
    @State private var isAnimatingView = false

    let location: Location
    let distance: Int?
    var onTap: (() -> Void)?

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]

    private typealias MyStrings = L10n.LocationDetail

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            topSection()

            aboutSection()
                .padding(.top, .x2)

            tagSection(tags: location.tags)
                .padding(.top, .x4)

            Button("") {
                onTap?()
            }
            .buttonStyle(IconButtonStyle(systemImage: .xMark))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, .x2)
        }
//        .offset(y: isAnimatingView ? 0 : .defaultContentWidth * 2)
        .opacity(isAnimatingView ? 1 : 0)
        .onAppear {
            withAnimation(.spring().delay(0.2)) {
                isAnimatingView = true
            }
        }
        .onDisappear {
            isAnimatingView = false
        }
    }

    @ViewBuilder
    private func topSection() -> some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: .x2) {
                iconLabel(image: .tram, text: location.subway)

                if let distance {
                    iconLabel(image: .walk, text: MyStrings.Walk.title(distance))
                } else {
                    iconLabel(image: .walk, text: MyStrings.Walk.notAvailable)
                }
            }
            .foregroundColor(Asset.Colors.Main.gray200.swiftUIColor)
        }
        .padding(.vertical, .x2)
    }

    @ViewBuilder
    private func iconLabel(image: SystemImage, text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemImage: image)
                .font(.system(size: 20))
                .frame(minWidth: .x3)

            Text(text.uppercased())
                .textStyle(.bodySBold)

            Spacer()
        }
    }

    @ViewBuilder
    private func aboutSection() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(MyStrings.About.title.uppercased())
                .textStyle(.bodyLBold)
                .padding(.bottom, .x2)

            Text(location.description.replacingOccurrences(of: "<br>", with: "\n\n"))
                .textStyle(.bodyM)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.trailing, .x6)

        }
        .foregroundColor(Asset.Colors.Main.primary.swiftUIColor)
    }

    @ViewBuilder
    private func tagSection(tags: [String]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(MyStrings.Tags.title.uppercased())
                .textStyle(.bodyLBold)
                .padding(.bottom, .x1)

            ForEach(tags, id: \.self) { tag in
                tagItem(title: tag)
                    .padding([.leading, .top], .x1)
            }
        }
        .foregroundColor(Asset.Colors.Main.primary.swiftUIColor)
    }

    @ViewBuilder
    private func tagItem(title: String) -> some View {
        HStack(spacing: .x1) {
            Circle()
                .frame(width: 4, height: 4)
                .offset(y: -2)

            Text(title)
                .textStyle(.bodyS)

            Spacer()
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    @Namespace static var animation

    static var previews: some View {
        LocationDetailView(location: Location.mockLocation, distance: 32)
    }
}
