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
}

struct TabBarView: View {

    @Binding var tabBarSelection: TabBarSelection

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

    private typealias MyStrings = L10n.Tabbar
    private typealias MyColors = Asset.Colors

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Spacer()

                HStack(spacing: 0) {
                    Capsule()
                        .fill(.thinMaterial)
                        .colorScheme(.light)
                        .frame(maxWidth: geo.size.width * 0.75, maxHeight: maxHeight)
                        .overlay(
                            Capsule()
                                .stroke(lineWidth: 0.2)
                                .fill(.gray)
                        )
                        .overlay(
                            ZStack {
                                Capsule()
                                    .padding(defaultPadding)
                                    .foregroundColor(MyColors.Main.primary.swiftUIColor)
                                    .frame(width: (geo.size.width * 0.75) / 2)
                                    .offset(x: calculateOffset(geo))

                                HStack(alignment: .center, spacing: 0) {
                                    Text(MyStrings.list)
                                        .textStyle(.bodyLBold)
                                        .foregroundColor(calculateTextColor(tabBarSelection == .list))
                                        .frame(width: (geo.size.width * 0.75) / 2)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            tabBarSelection = .list
                                        }

                                    Text(MyStrings.map)
                                        .textStyle(.bodyLBold)
                                        .foregroundColor(calculateTextColor(tabBarSelection == .map))
                                        .frame(width: (geo.size.width * 0.75) / 2)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            tabBarSelection = .map
                                        }
                                }
                                .foregroundColor(.white)
                            }
                        )
                        .animation(.spring().speed(2), value: calculateOffset(geo))
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

extension TabBarView {
    private func calculateOffset(_ geo: GeometryProxy) -> CGFloat {
        let capsuleWidth = (geo.size.width * 0.75) / 2
        let horizontalPadding = defaultPadding / (geo.size.width / defaultPadding)

        switch tabBarSelection {
        case .map:
            return (capsuleWidth / 2) - horizontalPadding
        case .list:
            return -((capsuleWidth / 2) + horizontalPadding)
        }
    }

    private func calculateTextColor(_ bool: Bool) -> Color {
        bool ? .white : MyColors.Main.primary.just()
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
}
