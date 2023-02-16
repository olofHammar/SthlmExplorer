//
//  ViewStateManager.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import Foundation
import Model

public protocol IViewStateManager {
    var viewStatePublisher: Published<ViewState>.Publisher { get }

    func presentSelectedDetail()
    func dismissSelectedDetail()
    func presentSelectedSheet()
    func dismissSelectedSheet()
}

public final class ViewStateManager: NSObject, ObservableObject, IViewStateManager {

    @Published var viewState: ViewState = .initial

    public var viewStatePublisher: Published<ViewState>.Publisher { $viewState }

    private var cancellables = Set<AnyCancellable>()
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }

    public func presentSelectedDetail() {
        self.viewState = .presentedLocationDetail
    }

    public func dismissSelectedDetail() {
        self.viewState = .dismissedLocationDetail
    }

    public func presentSelectedSheet() {
        self.viewState = .presentedLocationSheet
    }

    public func dismissSelectedSheet() {
        self.viewState = .dismissedLocationSheet
    }
}
