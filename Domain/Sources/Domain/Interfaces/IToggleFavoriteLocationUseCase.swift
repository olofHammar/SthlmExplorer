//
//  IToggleFavoriteLocationUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Foundation

public protocol IToggleFavoriteLocationUseCase {
    func toggleFavorite(_ id: String, isOn: Bool)
}
