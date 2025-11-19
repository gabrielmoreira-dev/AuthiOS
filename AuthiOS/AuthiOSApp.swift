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
        let authMethodListCoordinator = AuthMethodListCoordinator()
        coordinator.childCoordinator = authMethodListCoordinator
    }

    var body: some Scene {
        WindowGroup {
            coordinator.view
        }
    }

    @MainActor
    @ViewBuilder
    private func getDestination(_ route: AppRoute) -> some View {
        switch route {
        case .loginWithPassword:
            HomeCoordinator().view
        case .home:
            HomeCoordinator().view
        }
    }
}
