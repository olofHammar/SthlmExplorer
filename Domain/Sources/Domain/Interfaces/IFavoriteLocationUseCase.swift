//
//  IFavoriteLocationUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Foundation

public protocol IFavoriteLocationUseCase {
    func toggleFavorite(_ id: String, isOn: Bool)
    func isFavorite(_ id: String) -> Bool
}
