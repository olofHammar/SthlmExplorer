//
//  LocationFilter+.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-13.
//

import Foundation
import Model

/// An extension of struct `LocationFilter` which is used to set title, searchKey, headerTitle and headerCaption using content from folder `Resources`.
extension LocationFilter {

    typealias MyStrings = L10n.LocationFilter

    var title: String {
        switch self {
        case .all: return MyStrings.All.title
        case .landmarks: return MyStrings.Landmark.title
        case .scenicViews: return MyStrings.ScenicView.title
        case .museums: return MyStrings.Museum.title
        case .favorites: return MyStrings.Favorites.title
        }
    }

    var searchKey: String {
        switch self {
        case .all: return MyStrings.All.searchKey
        case .landmarks: return MyStrings.Landmark.searchKey
        case .scenicViews: return MyStrings.ScenicView.searchKey
        case .museums: return MyStrings.Museum.searchKey
        case .favorites: return MyStrings.Favorites.searchKey
        }
    }

    var headerTitle: String {
        switch self {
        case .all: return MyStrings.All.headerTitle
        case .landmarks: return MyStrings.Landmark.headerTitle
        case .scenicViews: return MyStrings.ScenicView.headerTitle
        case .museums: return MyStrings.Museum.headerTitle
        case .favorites: return MyStrings.Favorites.headerTitle
        }
    }

    var headerCaption: String {
        switch self {
        case .all: return MyStrings.All.headerCaption
        case .favorites: return MyStrings.Favorites.headerCaption
        default: return MyStrings.Explore.headerCaption
        }
    }
}
