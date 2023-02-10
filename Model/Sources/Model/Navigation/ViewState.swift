//
//  ViewState.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Foundation

public enum ViewState {
    case initial
    case presentedLocationDetail(_ location: LocationItem)
    case dismissedLocationDetail
    case presentedLocationSheet(_ location: LocationItem)
    case dismissedLocationSheet
}
