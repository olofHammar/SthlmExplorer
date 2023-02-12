//
//  TabBarView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import SwiftUI

enum TabBarSelection {
    case list
    case map

    var title: String {
        typealias MyStrings = L10n.Tabbar

        switch self {
        case .list:
            return MyStrings.list

        case .map:
            return MyStrings.map
        }
    }
}

struct TabBarView: View {

    @Binding var tabBarSelection: TabBarSelection
    @State private var shakeValue: CGFloat = 0

    let maxHeight: CGFloat
    let strokeWidth: CGFloat
    let defaultPadding: CGFloat

    init(
        tabBarSelection: Binding<TabBarSelection>,
        maxHeight: CGFloat = .tabBarHeight,
        strokeWidth: CGFloat = .strokeWidth,
        defaultPadding: CGFloat = .defaultPadding
    ) {
        self._tabBarSelection = tabBarSelection
        self.maxHeight = maxHeight
        self.strokeWidth = strokeWidth
        self.defaultPadding = defaultPadding
    }

    private typealias MyColors = Asset.Colors

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Spacer()

                HStack(spacing: 0) {
                    tapableText(.list, geo: geo)
                        .foregroundColor(MyColors.Main.primary.swiftUIColor)
                        .frame(maxHeight: maxHeight)
                        .overlay {
                            CustomCorner(corners: [.topLeft, .bottomLeft], radius: .capsuleRadius)
                                .fill(MyColors.Main.primary.swiftUIColor)
                                .overlay {
                                    tapableText(.map, geo: geo)
                                        .foregroundColor(tabBarSelection == .map ? .white : .clear)
                                        .scaleEffect(x: -1)
                                }
                                .overlay {
                                    tapableText(.list, geo: geo)
                                        .foregroundColor(tabBarSelection == .map ? .clear : .white)
                                }
                                .padding(defaultPadding)
                                .rotation3DEffect(
                                    .init(degrees: tabBarSelection == .list ? 0 : 180),
                                    axis: (x: 0, y: 1, z: 0),
                                    anchor: .trailing,
                                    perspective: 0.45
                                )
                        }
                        .zIndex(1)
                        .contentShape(Rectangle())

                    tapableText(.map, geo: geo)
                        .zIndex(0)
                        .foregroundColor(MyColors.Main.primary.swiftUIColor)
                        .frame(maxHeight: maxHeight)
                }
                .background(
                    ZStack {
                        Capsule()
                            .fill(.thinMaterial)
                            .colorScheme(.light)

                        Capsule()
                            .stroke(.gray, lineWidth: 0.2)
                    }
                )
                .frame(maxWidth: .infinity, alignment: .center)
                .rotation3DEffect(
                    .init(degrees: shakeValue),
                    axis: (x: 0, y: 1, z: 0)
                )
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }

    @ViewBuilder
    private func tapableText(_ tab: TabBarSelection, geo: GeometryProxy) -> some View {
        Text(tab.title)
            .textStyle(.bodyLBold)
            .contentTransition(.interpolate)
            .frame(width: (geo.size.width * 0.75) / 2)
            .contentShape(Rectangle())
            .onTapGesture {
                updateSelectedTab(with: tab)
            }
    }
}

extension TabBarView {
    private func updateSelectedTab(with tab: TabBarSelection) {
        withAnimation(.interactiveSpring(
            response: 0.4,
            dampingFraction: 1,
            blendDuration: 1
        )) {
            tabBarSelection = tab
        }

        withAnimation(.interactiveSpring(
            response: 0.5,
            dampingFraction: 0.5,
            blendDuration: 0.5
        ).delay(0.2)) {
            shakeValue = (tab == .map ? 5 : -5)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.interactiveSpring(
                response: 0.5,
                dampingFraction: 0.5,
                blendDuration: 0.5
            )) {
                shakeValue = 0
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarPreview_Wrap()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}

fileprivate struct TabBarPreview_Wrap: View {
    @State private var tabBarSelection: TabBarSelection = .list

    var body: some View {
        VStack {
            Spacer()

            TabBarView(tabBarSelection: $tabBarSelection)
        }
        .background(Asset.Colors.Background.b200.swiftUIColor)
    }
}

fileprivate extension CGFloat {
    static var tabBarHeight = CGFloat(56)
    static var strokeWidth = CGFloat(0.2)
    static var defaultPadding = CGFloat(4)
    static var capsuleRadius = CGFloat(50)
}
