import SwiftUI

protocol AuthMethodListCoordinating {
    func goToLoginWithPassword()
}

final class AuthMethodListCoordinator {
    private weak var appCoordinator: (any AppCoordinating<AppRoute>)?

    init(appCoordinator: (any AppCoordinating<AppRoute>)?) {
        self.appCoordinator = appCoordinator
    }
}

extension AuthMethodListCoordinator: AuthMethodListCoordinating {
    func goToLoginWithPassword() {
        appCoordinator?.push(.home)
    }
}
