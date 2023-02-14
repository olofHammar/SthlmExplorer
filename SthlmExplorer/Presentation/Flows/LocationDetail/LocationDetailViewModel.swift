//
//  LocationDetailViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-14.
//

import Navigation
import ShortcutFoundation
import SwiftUI

final class LocationDetailViewModel: ObservableObject {
    @Inject private var viewStateManager: IViewStateManager

    func dismissSelectedDetail() {
        viewStateManager.dismissSelectedDetail()
    }
}
