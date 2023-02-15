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
    var onTap: (() -> Void)?

    private typealias MyStrings = L10n.LocationDetail

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            topSection()

            aboutSection()

            Button("") {
                onTap?()
            }
            .buttonStyle(IconButtonStyle(systemImage: .xMark))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, .x2)
        }
        .offset(y: isAnimatingView ? 0 : .defaultContentWidth * 2)
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
            HStack {
                Asset.Images.Icons.tram.just()
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .x3, height: .x3)

                Text(location.subway)
                    .textStyle(.bodyMPlay)

                Spacer()
            }
        }
        .padding(.vertical, .x2)
        .frame(height: 60)
        .foregroundColor(Asset.Colors.Main.accent.just())
    }

    @ViewBuilder
    private func aboutSection() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(MyStrings.About.title.uppercased())
                .textStyle(.bodyLBold)
                .padding(.bottom, .x1)

            Text(location.description.replacingOccurrences(of: "<br>", with: "\n\n"))
                .textStyle(.bodyMPlay)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.trailing, .x1)
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

        }
        .padding(.x4)
        .background(.thinMaterial)
        .modifier(RoundedCardModifier())
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    @Namespace static var animation

    static var previews: some View {
        LocationDetailView(location: Location.mockLocation)}
}
