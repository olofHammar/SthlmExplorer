//
//  ModalPresentation.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Foundation

public enum ModalPresentationState: Identifiable {
    case fullScreenDetailScreen

    public var id: String {
        switch self {
        case .fullScreenDetailScreen: return "fullScreenDetailScreen"
        }
    }
}

public enum ModalPresentationType {
    case sheet
    case fullScreen
}
