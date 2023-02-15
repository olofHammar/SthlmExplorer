//
//  LocationDetailView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-14.
//

import CoreLocation
import Navigation
import Model
import ShortcutFoundation
import SwiftUI

struct LocationDetailView: View {
    @Inject private var externalViewRouter: IExternalViewRouter
    @State private var isAnimatingView = false

    let location: Location
    let distance: Int?
    var onClose: (() -> Void)?

    private typealias MyStrings = L10n.LocationDetail

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            topSection()
                .padding(.vertical, .x2)

            aboutSection()
                .padding(.vertical, .x2)

            tagSection(tags: location.tags)
                .padding(.vertical, .x2)

            if let timeSlots = location.info {
                openingHoursSection(hours: timeSlots)
                    .padding(.vertical, .x2)
            }

            Button("") {
                onClose?()
            }
            .buttonStyle(IconButtonStyle(systemImage: .xMark))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, .x2)
        }
        .foregroundColor(Asset.Colors.Main.primary.swiftUIColor)
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
            VStack(alignment: .leading, spacing: .x1) {
                HStack {
                    iconLabel(image: .tram, text: location.subway)

                    Spacer()

                    shareLocationButton()
                }

                if let distance {
                    iconLabel(image: .walk, text: MyStrings.Walk.title(distance))
                } else {
                    iconLabel(image: .walk, text: MyStrings.Walk.notAvailable)
                }
            }
            .foregroundColor(Asset.Colors.Main.gray200.swiftUIColor)
        }
    }

    @ViewBuilder
    private func shareLocationButton() -> some View {
        Button {
            externalViewRouter.presentLocationShareSheet(
                with: location.title,
                for: CLLocation(latitude: location.latitude, longitude: location.longitude)
            )
        } label: {
            HStack {
                Image(systemImage: .location)

                Text("Share Location")
            }
            .textStyle(.bodyMBold)
            .foregroundColor(Asset.Colors.Main.secondary.swiftUIColor)
        }
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
                .padding(.trailing, .x4)

        }
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
    }

    @ViewBuilder
    private func tagItem(title: String) -> some View {
        HStack(spacing: .x1) {
            Circle()
                .frame(width: 4, height: 4)

            Text(title)
                .textStyle(.bodyS)

            Spacer()
        }
    }

    @ViewBuilder
    private func openingHoursSection(hours: [String]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(MyStrings.OpeningHours.title.uppercased())
                .textStyle(.bodyLBold)
                .padding(.bottom, .x1)

            ForEach(hours, id: \.self) { timeSlot in
                Text(timeSlot)
                    .textStyle(.bodyS)
                    .padding([.leading, .top], .x1)
            }
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: Location.mockLocation, distance: 32)
    }
}
