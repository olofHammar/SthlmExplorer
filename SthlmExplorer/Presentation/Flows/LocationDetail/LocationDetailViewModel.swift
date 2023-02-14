//
//  LocationDetailViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-14.
//

import Model
import Navigation
import ShortcutFoundation
import SwiftUI

final class LocationDetailViewModel: ObservableObject {
    @Inject var viewStateManager: IViewStateManager

    func dismissSelectedDetail() {
        viewStateManager.dismissSelectedDetail()
    }
}
