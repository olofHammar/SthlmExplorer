//
//  ExternalViewRouter.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import CoreLocation
import LinkPresentation
import SwiftUI
import UIKit

/// The IExternalViewRouter protocol defines the interface for a view router that presents external views, such as the system share sheet.
public protocol IExternalViewRouter {

    /// Presents a share sheet with the given title and location.
    /// - Parameters:
    ///   - title: The title for the share sheet.
    ///   - location: The location to be shared.
    func presentLocationShareSheet(with title: String, for location: CLLocation)
}

/// The ExternalViewRouter class provides an implementation of the `IExternalViewRouter` protocol for presenting external views.
public final class ExternalViewRouter: IExternalViewRouter {

    /// Initializes a new `ExternalViewRouter`.
    public init() {}

    /// Presents a share sheet with the given title and location.
    /// - Parameters:
    ///   - title: The title for the share sheet.
    ///   - location: The location to be shared.
    public func presentLocationShareSheet(with title: String, for location: CLLocation) {
        let sheet = ShareSheet(title: title, location: location)
        let hostingViewController = UIHostingController(rootView: sheet)

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }

        window.rootViewController?.present(hostingViewController, animated: true)
    }
}

/// The ShareSheet struct provides a SwiftUI view that wraps a `UIActivityViewController, which presents the system share sheet for sharing a location.
private struct ShareSheet: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIActivityViewController

    let title: String
    let location: CLLocation

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        guard let url = URL.appleMapsURL(for: location) else {
            return UIActivityViewController(activityItems: [], applicationActivities: nil)
        }

        let items: [Any] = ["Check out \(title)", url]

        return UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) { }
}

private extension URL {

    /// Returns an URL object for opening Apple Maps at the specified location.
    /// - Parameter location: The location to open in Apple Maps.
    /// - Returns: An URL object for opening Apple Maps at the specified location, or nil if the location is invalid.
    static func appleMapsURL(for location: CLLocation) -> URL? {
        URL(string: "http://maps.apple.com/?saddr=&daddr=\(location.coordinate.latitude),\(location.coordinate.longitude)")
    }
}
