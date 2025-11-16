//
//  AuthiOSApp.swift
//  AuthiOS
//
//  Created by Gabriel on 16/11/25.
//

import SwiftUI

@main
struct AuthiOSApp: App {
    private var coordinator: AppCoordinator

    init() {
        self.coordinator = AppCoordinator()
        self.coordinator.childCoordinator = HomeCoordinator()
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                coordinator.view()
            }
        }
    }
}
