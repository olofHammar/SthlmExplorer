//
//  ModalViewRouter.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Model
import UIKit

/// The ModalPresenter protocol defines methods for managing modals within the app.
public protocol ModalPresenter {
    /// Sets the state, type, and onDismiss block of the modal.
    /// - Parameters:
    ///   - state: The state of the modal presentation.
    ///   - type: The type of the modal presentation.
    func setModal(state: ModalPresentationState, type: ModalPresentationType)

    /// Sets the state, type, and onDismiss block of the modal.
    /// - Parameters:
    ///   - state: The state of the modal presentation.
    ///   - type: The type of the modal presentation.
    ///   - onDismiss: A block of code to run when the modal is dismissed.
    func setModal(state: ModalPresentationState, type: ModalPresentationType, onDismiss: @escaping() -> Void)

    /// Closes the currently presented modal.
    func closeModal()
}

/// The ModalViewRouter class is responsible for managing the presentation of modals within the app.
public final class ModalViewRouter: ObservableObject, ModalPresenter {

    /// The presentation state for a sheet modal.
    @Published var sheetPresentationState: ModalPresentationState?

    /// The presentation state for a full-screen modal.
    @Published var fullScreenModalPresentationState: ModalPresentationState?

    /// Initializes a new `ModalViewRouter`.
    public init() {}

    /// Sets the state, type, and onDismiss block of the modal.
    /// - Parameters:
    ///   - state: The state of the modal presentation.
    ///   - type: The type of the modal presentation.
    public func setModal(state: ModalPresentationState, type: ModalPresentationType) {
        modal(state: state, type: type, onDismiss: nil)
    }

    /// Sets the state, type, and onDismiss block of the modal.
    /// - Parameters:
    ///   - state: The state of the modal presentation.
    ///   - type: The type of the modal presentation.
    ///   - onDismiss: A block of code to run when the modal is dismissed.
    public func setModal(state: ModalPresentationState, type: ModalPresentationType, onDismiss: @escaping () -> Void) {
        modal(state: state, type: type, onDismiss: onDismiss)
    }

    public func closeModal() {
        sheetPresentationState = nil
        fullScreenModalPresentationState = nil
    }

    /// Presents a modal with the given presentation state and type.
    /// - Parameters:
    ///  - state: The presentation state for the modal.
    ///  - type: The presentation type for the modal.
    ///  - onDismiss: The closure to be called when the modal is dismissed.
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
