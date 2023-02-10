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

    func presentSelectedDetail(for location: LocationItem)
    func dismissSelectedDetail()
    func presentSelectedSheet(for location: LocationItem)
    func dismissSelectedSheet()
}

public final class ViewStateManager: NSObject, ObservableObject, IViewStateManager {

    @Published var viewState: ViewState = .initial

    public var viewStatePublisher: Published<ViewState>.Publisher { $viewState }

    private var cancellables = Set<AnyCancellable>()
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }

    public func presentSelectedDetail(for location: LocationItem) {
        self.viewState = .presentedLocationDetail(location)
    }

    public func dismissSelectedDetail() {
        self.viewState = .dismissedLocationDetail
    }

    public func presentSelectedSheet(for location: LocationItem) {
        self.viewState = .presentedLocationSheet(location)
    }

    public func dismissSelectedSheet() {
        self.viewState = .dismissedLocationSheet
    }
}
