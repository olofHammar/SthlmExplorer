//
//  ViewStateManager.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import Foundation
import Model

/// A protocol that defines methods for presenting and dismissing views.
public protocol IViewStateManager {
    /// A publisher that emits changes to the view state.
    var viewStatePublisher: Published<ViewState>.Publisher { get }

    /// Presents the selected detail view.
    func presentSelectedDetail()

    /// Dismisses the selected detail view.
    func dismissSelectedDetail()

    /// Presents the selected sheet view.
    func presentSelectedSheet()

    /// Dismisses the selected sheet view.
    func dismissSelectedSheet()
}

/// A class that manages the state of views.
public final class ViewStateManager: NSObject, ObservableObject, IViewStateManager {

    /// The current view state.
    @Published var viewState: ViewState = .initial

    /// A publisher that emits changes to the view state.
    public var viewStatePublisher: Published<ViewState>.Publisher { $viewState }

    /// The set of cancellables used to manage subscriptions.
    private var cancellables = Set<AnyCancellable>()

    /// Deinitializes the view state manager.
    deinit {
        cancellables.forEach { $0.cancel() }
    }

    /// Presents the selected detail view.
    public func presentSelectedDetail() {
        self.viewState = .presentedLocationDetail
    }

    /// Dismisses the selected detail view.
    public func dismissSelectedDetail() {
        self.viewState = .dismissedLocationDetail
    }

    /// Presents the selected sheet view.
    public func presentSelectedSheet() {
        self.viewState = .presentedLocationSheet
    }

    /// Dismisses the selected sheet view.
    public func dismissSelectedSheet() {
        self.viewState = .dismissedLocationSheet
    }
}
