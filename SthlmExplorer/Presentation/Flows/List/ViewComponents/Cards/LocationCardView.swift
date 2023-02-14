//
//  LocationCardView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Model
import SwiftUI

struct LocationCardView: View {
    let title: String
    let type: Location.LocationType
    let imageURL: String?

    private let cardHeight: CGFloat = .defaultCardHeight

    @Binding var isFavorite: Bool
    var onTap: (() -> Void)?

    init(
        title: String,
        type: Location.LocationType,
        imageURL: String?,
        isFavorite: Binding<Bool>,
        onTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.type = type
        self.imageURL = imageURL
        self._isFavorite = isFavorite
        self.onTap = onTap
    }

    init(
        location: Location,
        isFavorite: Binding<Bool>,
        onTap: (() -> Void)? = nil
    ) {
        self.init(
            title: location.title,
            type: location.type,
            imageURL: location.image,
            isFavorite: isFavorite,
            onTap: onTap
        )
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            GeometryReader { proxy in
                RemoteImageView(
                    urlString: imageURL,
                    placeholder: Asset.Colors.Main.gray100.swiftUIColor.embedInAnyView()
                )
            }
            .frame(height: cardHeight)
            .modifier(RoundedCardModifier())
            .onTapGesture {
                onTap?()
            }

            VStack(alignment: .leading, spacing: 0) {
                titleAndToggleSection()

                Text(type.rawValue.uppercased())
                    .textStyle(.bodySBold)
                    .foregroundColor(.gray)
            }
            .padding(.top, .x1)
        }
    }

    @ViewBuilder
    private func titleAndToggleSection() -> some View {
        HStack(alignment: .top, spacing: 0) {
            Text(title.capitalized)
                .textStyle(.headerThreePlay)
                .minimumScaleFactor(0.5)
                .lineLimit(1)

            Spacer()

            favoriteToggle()
        }
    }

    @ViewBuilder
    private func favoriteToggle() -> some View {
        Toggle("", isOn: $isFavorite)
            .toggleStyle(FavoriteToggleStyle(isFavorite: isFavorite))
    }
}

struct LocationCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCardView(location: .mockLocation, isFavorite: .constant(false))
    }
}
