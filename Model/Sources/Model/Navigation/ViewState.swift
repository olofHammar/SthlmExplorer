//
//  ViewState.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Foundation

/// An Enum representing the available selection of states for `ViewStateManager`.
public enum ViewState {
    case initial
    case presentedLocationDetail
    case dismissedLocationDetail
    case presentedLocationSheet
    case dismissedLocationSheet
}
