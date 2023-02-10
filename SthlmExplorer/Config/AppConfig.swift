//
//  AppConfig.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Data
import Domain
import Foundation
import Location
import Navigation
import ShortcutFoundation

struct AppConfig: Config {
    func configure(_ injector: ShortcutFoundation.Injector) {
        configureDataInjections(injector)
        configureDomainInjections(injector)
        configureNavigationInjections(injector)
        configureViewModelInjections(injector)
        configurePresentationInjections(injector)
    }
}

private extension AppConfig {
    func configureDataInjections(_ injector: Injector) {
        injector.map(ILocationItemDataSource.self) {
            if isRunningInPreview {
                return StaticLocationItemDataSource()
            } else {
                return LocationItemDataSource()
            }
        }
    }

    func configureDomainInjections(_ injector: Injector) {
        injector.map(ILocationItemsRepository.self) {
            LocationItemsRepository()
        }
    }

    func configureLocationInjections(_ injector: Injector) {
        injector.map(ILocationManager.self) {
            LocationManager()
        }
    }

    func configureNavigationInjections(_ injector: Injector) {
        injector.map(IViewStateManager.self) {
            ViewStateManager()
        }

        injector.map(ModalViewRouter.self) {
            ModalViewRouter()
        }

        injector.map(IExternalViewRouter.self) {
            ExternalViewRouter()
        }
    }

    func configurePresentationInjections(_ injector: Injector) {
        injector.map(IFetchLocationItemsUseCase.self) {
            if isRunningInPreview {
                return StaticFetchLocationItemsUseCase()
            } else {
                return FetchLocationItemsUseCase()
            }
        }
    }

    func configureViewModelInjections(_ injector: Injector) {
        injector.map(RootViewModel.self) {
            RootViewModel()
        }

        injector.map(ListViewModel.self) {
            ListViewModel()
        }

        injector.map(MapViewModel.self) {
            MapViewModel()
        }
    }
}

private extension AppConfig {
    var isRunningInPreview: Bool { ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" }
}
