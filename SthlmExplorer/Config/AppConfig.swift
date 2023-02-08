//
//  AppConfig.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Data
import Domain
import Foundation
import ShortcutFoundation

struct AppConfig: Config {
    func configure(_ injector: ShortcutFoundation.Injector) {
        configureDataInjections(injector)
        configureDomainInjections(injector)
        configureViewModelInjections(injector)
    }
}

private extension AppConfig {
    func configureDataInjections(_ injector: Injector) {
        injector.map(ILocationItemDataSource.self) {
            if isRunningTests || isRunningInPreview {
                return StaticLocationItemDataSource()
            } else {
                return LocationItemDataSource()
            }
        }
    }

    func configureDomainInjections(_ injector: Injector) {

    }

    func configureViewModelInjections(_ injector: Injector) {

    }
}

private extension AppConfig {
    var isRunningInPreview: Bool { ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" }
    var isRunningTests: Bool { ProcessInfo.processInfo.environment["XCTestConfigureFilePath"] != nil }
}
