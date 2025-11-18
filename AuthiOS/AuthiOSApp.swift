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
        self.coordinator = AppCoordinator()
    }

    var body: some Scene {
        WindowGroup {
            RootView(destination: getDestination) {
                AuthMethodListFactory.build(appCordinator: coordinator)
            }
            .environmentObject(coordinator)
        }
    }

    @ViewBuilder
    private func getDestination(_ route: AppRoute) -> some View {
        switch route {
        case .loginWithPassword:
            AuthMethodListFactory.build()
        case .home:
            HomeFactory.build(appCoordinator: coordinator)
        }
    }
}
