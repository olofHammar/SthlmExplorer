//
//  LocationDetailView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-14.
//

import Model
import SwiftUI

struct LocationDetailView: View {
    @StateObject private var vm: LocationDetailViewModel

    let animation: Namespace.ID

    private typealias MyStrings = L10n.LocationDetail

    init(
        locationItem: LocationItem,
        animation: Namespace.ID
    ) {
        _vm = StateObject(wrappedValue: LocationDetailViewModel(
            locationItem: locationItem)
        )
        self.animation = animation
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        LocationCardView(
                            location: vm.location,
                            isFavorite: $vm.isFavorite,
                            animation: animation,
                            isDetail: true
                        )
                        .padding(.bottom, .x2)

                        VStack(alignment: .leading, spacing: 0) {
                            topSection()

                            aboutSection()
                        }
                        .offset(y: vm.isAnimatingInfoSection ? 0 : geo.size.height)
                        .opacity(vm.isAnimatingInfoSection ? 1 : 0)

                        Spacer()
                    }
                }
                .ignoresSafeArea(edges: .top)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Asset.Colors.Background.b100.swiftUIColor)

                topNavBar()
            }
            .transition(.identity)
        }
        .onAppear {
            withAnimation(.spring().delay(0.2)) {
                vm.prepareAnimationForInfoSection()
            }
        }
        .onDisappear {
            vm.resetAnimationForInfoSection()
        }
    }

    @ViewBuilder
    private func topNavBar() -> some View {
        VStack {
            HStack {
                Spacer()
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(vm.location.title.capitalized)
                    .textStyle(.bodyLBoldPlay)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(minWidth: .x14)
//                    .offset(y: vm.isShowingNavBarWithTitle ? 0 : 20)
//                    .opacity(vm.isShowingNavBarWithTitle ? 1 : 0)
//                    .animation(.easeInOut, value: vm.isShowingNavBarWithTitle)
                Button("") {
                    vm.dismissSelectedDetail()
                }
                .buttonStyle(IconButtonStyle(systemImage: .xMark))
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding([.horizontal, .top])
            .foregroundColor(Asset.Colors.Main.accent.just())

            Spacer()
        }
        .padding(.top)
        .frame(maxWidth: .infinity)
        .frame(height: 80)
//        .background(vm.isShowingNavBarWithTitle ? Asset.Color.Background.b200.just() : .clear)
        .background(.clear)
    }

    @ViewBuilder
    private func topSection() -> some View {
        VStack(spacing: 0) {
            HStack {
                Asset.Images.Icons.tram.just()
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .x3, height: .x3)

                Text(vm.location.subway)
                    .textStyle(.bodyMPlay)

                Spacer()

                Asset.Images.Icons.figureWalk.just()
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .x3, height: .x3)

//                Text(setDistanceToLocation())
                Text("4 km away")
                    .textStyle(.bodyMPlay)
            }
            .padding(.vertical, .x2)
        }
        .padding([.vertical, .horizontal], .x2)
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .foregroundColor(Asset.Colors.Main.accent.just())
        .background(Asset.Colors.Background.b100.just())
    }

    @ViewBuilder
    private func aboutSection() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(MyStrings.About.title.uppercased())
                .textStyle(.bodyLBold)
                .padding(.bottom, .x1)

            Text(vm.location.description.replacingOccurrences(of: "<br>", with: "\n\n"))
                .textStyle(.bodyMPlay)
                .padding(.trailing, .x1)
                .frame(maxWidth: .infinity, alignment: .leading)

        }
        .padding(.x4)
        .background(.white)
        .modifier(RoundedCardModifier())
        .padding(.x2)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    @Namespace static var animation

    static var previews: some View {
        LocationDetailView(
            locationItem: LocationItem.init(location: .mockLocation, isFavorite: false),
            animation: animation)
    }
}
