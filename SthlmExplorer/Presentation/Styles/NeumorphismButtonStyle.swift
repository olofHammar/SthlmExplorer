//
//  NeumorphismButtonStyle.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import SwiftUI

struct NeumorphismButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {

        configuration.label
            .textStyle(.bodyMBold)
            .foregroundColor(Asset.Colors.Main.accent.just())
            .frame(minWidth: .x12)
            .frame(height: .x7)
            .background(
                Capsule(style: .circular)
                    .foregroundColor(Asset.Colors.Background.b200.just())
                    .shadow(color: Color.white, radius: 1, x: -1, y: -1)
                    .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
            )
    }
}


struct NeumorphismButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()

            Button("Label", action: {})
                .buttonStyle(NeumorphismButtonStyle())
                .padding(30)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Asset.Colors.Background.b200.just())
    }
}
