//
//  AuthiOSApp.swift
//  AuthiOS
//
//  Created by Gabriel on 16/11/25.
//

import SwiftUI

@main
struct AuthiOSApp: App {
    private var coordinator: AppCoordinator<AppRoute>

    init() {
        coordinator = AppCoordinator()
        let authMethodListCoordinator = AuthMethodListCoordinator(
            navigationController: coordinator.navigationController
        )
        coordinator.childCoordinator = authMethodListCoordinator
    }

    var body: some Scene {
        WindowGroup {
            RootView(destination: getDestination) {
                coordinator.view
            }
            .environmentObject(coordinator.navigationController)
        }
    }

    @MainActor
    @ViewBuilder
    private func getDestination(_ route: AppRoute) -> some View {
        switch route {
        case .loginWithPassword:
            HomeCoordinator(navigationController: coordinator.navigationController).view
        case .home:
            HomeCoordinator(navigationController: coordinator.navigationController).view
        }
    }
}
