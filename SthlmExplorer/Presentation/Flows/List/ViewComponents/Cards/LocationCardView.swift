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

fileprivate extension Location {
    static var mockLocation: Location {
        .init(
            id: "abcd",
            title: "Royal Palace",
            description: "Welcome to one of the largest palaces in Europe! The Royal Palace is the official residence of His Majesty the King of Sweden, with over 600 rooms.<br>The Palace is open to the public and offers no less than five museums. The Palace was largely built during the eighteenth century in the Italian Baroque style, on the spot where the “Tre Kronor” castle burned down in 1697. Visit the reception rooms with splendid interiors from the eighteenth and nineteenth centuries, Rikssalen (the Hall of State) with Queen Kristina’s silver throne, and Ordenssalarna (Halls of the Orders of Chivalry). You can also see Gustav III’s Museum of Antiquities, the Tre Kronor Museum, and the Treasury.<br>The Royal Palace also contains the Armory, with royal costumes and armor, as well as coronation carriages and magnificent coaches from the Royal Stable. Make sure not to miss the parade of soldiers and the daily changing of the guard.",
            type: .landmark,
            image: "https://a.cdn-hotels.com/gdcs/production150/d379/233f5a72-9aec-4921-b5e8-925afcbca8c4.jpg",
            latitude: 59.32694,
            longitude: 18.07176
        )
    }
}
