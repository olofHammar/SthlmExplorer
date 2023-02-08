//
//  SthlmExplorerApp.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Firebase
import ShortcutFoundation
import SwiftUI
import UIKit

@main
struct SthlmExplorerApp: App {

    let context = Context(AppConfig())

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
