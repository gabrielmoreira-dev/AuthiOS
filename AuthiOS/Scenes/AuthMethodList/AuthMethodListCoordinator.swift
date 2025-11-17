import SwiftUI

protocol AuthMethodListCoordinatorType {
    func goToLoginWithPassword()
}

final class AuthMethodListCoordinator: AuthMethodListCoordinatorType {
    private weak var appCoordinator: (any AppCoordinating<AppRoute>)?

    init(appCoordinator: (any AppCoordinating<AppRoute>)?) {
        self.appCoordinator = appCoordinator
    }

    func goToLoginWithPassword() {
        appCoordinator?.present(.loginWithPassword)
    }
}
