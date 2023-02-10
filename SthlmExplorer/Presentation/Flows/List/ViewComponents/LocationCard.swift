//
//  LocationCard.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Model
import SwiftUI

struct LocationCard: View {

    let location: Location

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topLeading) {
                GeometryReader { proxy in
                    AsyncImage(url: URL(string: location.image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .overlay(
                                LinearGradient(colors: [.black.opacity(1), .clear, .clear], startPoint: .bottom, endPoint: .top)
                            )
                            .frame(width: proxy.size.width, height: proxy.size.height)
                            .clipped()
                    } placeholder: {
                        Color.white
                    }
                }
                .frame(height: 300)
            }
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(Asset.Colors.Main.pinkLight.swiftUIColor)
                    .frame(width: 54, height: 54)
                    .shadow(color: .gray, radius: -2)
                    .overlay(
                        Asset.Images.Icons.magnifyingglass.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                            .foregroundColor(Asset.Colors.Main.pink.swiftUIColor)
                    )
                    .padding(.trailing, .x2)
                    .offset(y: 27)
            }

            Spacer()

            VStack(alignment: .leading, spacing: .x1) {
                Text(location.title.capitalized)
                    .textStyle(.headerTwoPlay)

                Text(location.type.uppercased())
                    .foregroundColor(.gray)
                    .padding(.trailing, 54)
            }
            .padding([.horizontal, .bottom], .x2)
        }
        .frame(height: 400, alignment: .topLeading)
        .background(Asset.Colors.Background.b100.swiftUIColor)
        .cornerRadius(.x2)
        .shadow(radius: .x2)
    }
}

struct LocationCard_Previews: PreviewProvider {
    static var previews: some View {
        LocationCard(location: .mockLocation)
    }
}

fileprivate extension Location {
    static var mockLocation: Location {
        .init(
            id: "abcd",
            title: "Royal Palace",
            description: "Welcome to one of the largest palaces in Europe! The Royal Palace is the official residence of His Majesty the King of Sweden, with over 600 rooms.<br>The Palace is open to the public and offers no less than five museums. The Palace was largely built during the eighteenth century in the Italian Baroque style, on the spot where the “Tre Kronor” castle burned down in 1697. Visit the reception rooms with splendid interiors from the eighteenth and nineteenth centuries, Rikssalen (the Hall of State) with Queen Kristina’s silver throne, and Ordenssalarna (Halls of the Orders of Chivalry). You can also see Gustav III’s Museum of Antiquities, the Tre Kronor Museum, and the Treasury.<br>The Royal Palace also contains the Armory, with royal costumes and armor, as well as coronation carriages and magnificent coaches from the Royal Stable. Make sure not to miss the parade of soldiers and the daily changing of the guard.",
            type: "landmark",
            image: "https://a.cdn-hotels.com/gdcs/production150/d379/233f5a72-9aec-4921-b5e8-925afcbca8c4.jpg",
            latitude: 59.32694,
            longitude: 18.07176
        )
    }
}

//private func cardView(location: Location) -> some View {
//    VStack(spacing: 0) {
//        ZStack(alignment: .topLeading) {
//            GeometryReader { proxy in
//                KFImage(URL(string: location.image))
//                    .resizable()
//                    .scaledToFill()
//                    .overlay(
//                        LinearGradient(colors: [.black.opacity(1), .clear, .clear], startPoint: .bottom, endPoint: .top)
//                    )
//                    .frame(width: proxy.size.width, height: proxy.size.height)
//                    .clipped()
//            }
//            .frame(height: 250)
//        }
//        .overlay(alignment: .bottomLeading) {
//            VStack(alignment: .leading, spacing: .x1) {
//                Spacer()
//                VStack(alignment: .leading, spacing: .x1) {
//
//                    Text(location.title.capitalized)
//                        .textStyle(.headerTwoPlay)
//                        .matchedGeometryEffect(id: "title/\(location.id)",
//                                               in: animation,
//                                               properties: .frame,
//                                               anchor: .center,
//                                               isSource: !isSource)
//
//                    Text(location.type.title.uppercased())
//                        .textStyle(.bodyMSemiBold)
//                        .foregroundColor(Asset.Color.Main.secondary.just())
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//            }
//            .padding(.horizontal, .x2)
//            .padding(.bottom, .x3)
//            .foregroundColor(.white)
//        }
//    }
//    .cornerRadius(.x2)
//}
