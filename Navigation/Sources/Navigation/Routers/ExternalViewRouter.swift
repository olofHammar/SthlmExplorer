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

public protocol IExternalViewRouter {
    func presentLocationShareSheet(with title: String, for location: CLLocation)
}

public final class ExternalViewRouter: IExternalViewRouter {

    public init() {}
    
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
    static func appleMapsURL(for location: CLLocation) -> URL? {
        URL(string: "http://maps.apple.com/?saddr=&daddr=\(location.coordinate.latitude),\(location.coordinate.longitude)")
    }
}
