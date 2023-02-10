//
//  ModalViewRouter.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Model
import UIKit

public protocol ModalPresenter {
    func setModal(state: ModalPresentationState, type: ModalPresentationType)
    func setModal(state: ModalPresentationState, type: ModalPresentationType, onDismiss: @escaping() -> Void)
    func closeModal()
}

public final class ModalViewRouter: ObservableObject, ModalPresenter {

    @Published var sheetPresentationState: ModalPresentationState?
    @Published var fullScreenModalPresentationState: ModalPresentationState?

    public init() {}

    public func setModal(state: ModalPresentationState, type: ModalPresentationType) {
        modal(state: state, type: type, onDismiss: nil)
    }

    public func setModal(state: ModalPresentationState, type: ModalPresentationType, onDismiss: @escaping () -> Void) {
        modal(state: state, type: type, onDismiss: onDismiss)
    }

    public func closeModal() {
        sheetPresentationState = nil
        fullScreenModalPresentationState = nil
    }

    private func modal(state: ModalPresentationState, type: ModalPresentationType, onDismiss: (() -> Void)? = nil) {
        if sheetPresentationState == nil, fullScreenModalPresentationState == nil {
            switch type {
            case .fullScreen:
                fullScreenModalPresentationState = state
            case .sheet:
                sheetPresentationState = state
            }
        } else {
            closeModal()

            if let onDismiss = onDismiss {
                onDismiss()
            }

            DispatchQueue.main.asyncAfter(deadline: .now().advanced(by: .milliseconds(300))) {
                self.modal(state: state, type: type, onDismiss: onDismiss ?? nil)
            }
        }
    }
}
