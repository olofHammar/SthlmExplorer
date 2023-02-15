//
//  LocationCardView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Model
import SwiftUI

struct LocationCardView: View {
    @Binding var isFavorite: Bool

    let id: String
    let title: String
    let type: Location.LocationType
    let imageURL: String?
    let animation: Namespace.ID
    var onTap: (() -> Void)?

    init(
        isFavorite: Binding<Bool>,
        id: String,
        title: String,
        type: Location.LocationType,
        imageURL: String?,
        animation: Namespace.ID,
        onTap: (() -> Void)? = nil
    ) {
        self._isFavorite = isFavorite
        self.id = id
        self.title = title
        self.type = type
        self.imageURL = imageURL
        self.animation = animation
        self.onTap = onTap
    }

    init(
        isFavorite: Binding<Bool>,
        location: Location,
        animation: Namespace.ID,
        onTap: (() -> Void)? = nil
    ) {
        self.init(
            isFavorite: isFavorite,
            id: location.id,
            title: location.title,
            type: location.type,
            imageURL: location.image,
            animation: animation,
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
            .frame(height: .defaultCardHeight)
            .modifier(RoundedCardModifier(cornerRadius: .x2))
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
        .matchedGeometryEffect(id: id, in: animation)
    }

    @ViewBuilder
    private func titleAndToggleSection() -> some View {
        HStack(alignment: .top, spacing: 0) {
            Text(title.capitalized)
                .textStyle(.headerThreePlay)

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
    @Namespace static var animation

    static var previews: some View {
        LocationCardView(
            isFavorite: .constant(false),
            location: .mockLocation,
            animation: animation
        )
    }
}
