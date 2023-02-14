//
//  LocationCardView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Model
import SwiftUI

struct LocationCardView: View {
    let id: String
    let title: String
    let type: Location.LocationType
    let imageURL: String?

    private let cardHeight: CGFloat = .defaultCardHeight

    @Binding var isFavorite: Bool

    let animation: Namespace.ID
    let isDetail: Bool
    var onTap: (() -> Void)?

    init(
        id: String,
        title: String,
        type: Location.LocationType,
        imageURL: String?,
        isFavorite: Binding<Bool>,
        animation: Namespace.ID,
        isDetail: Bool,
        onTap: (() -> Void)? = nil
    ) {
        self.id = id
        self.title = title
        self.type = type
        self.imageURL = imageURL
        self._isFavorite = isFavorite
        self.animation = animation
        self.isDetail = isDetail
        self.onTap = onTap
    }

    init(
        location: Location,
        isFavorite: Binding<Bool>,
        animation: Namespace.ID,
        isDetail: Bool,
        onTap: (() -> Void)? = nil
    ) {
        self.init(
            id: location.id,
            title: location.title,
            type: location.type,
            imageURL: location.image,
            isFavorite: isFavorite,
            animation: animation,
            isDetail: isDetail,
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
            .frame(height: isDetail ? 400 : cardHeight)
            .modifier(RoundedCardModifier(cornerRadius: isDetail ? 0 : .x2))
            .onTapGesture {
                onTap?()
            }

            VStack(alignment: .leading, spacing: 0) {
                titleAndToggleSection()

                Text(type.rawValue.uppercased())
                    .textStyle(.bodySBold)
                    .foregroundColor(.gray)
            }
            .padding(.top, isDetail ? .x2 : .x1)
            .padding(.horizontal, isDetail ? .x2 : 0)
        }
        .matchedGeometryEffect(id: id, in: animation, properties: .frame, isSource: true)
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
            location: .mockLocation,
            isFavorite: .constant(false),
            animation: animation,
            isDetail: false
        )
    }
}
