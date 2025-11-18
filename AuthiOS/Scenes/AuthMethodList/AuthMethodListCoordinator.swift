import SwiftUI

protocol AuthMethodListCoordinating {
    func goToLoginWithPassword()
}

final class AuthMethodListCoordinator: Coordinator {
    var navigationController: NavigationController<AppRoute>
    var delegate: (any CoordinatorDelegate)?

    init(navigationController: NavigationController<AppRoute>) {
        self.navigationController = navigationController
    }

    func finish() {

    }
}

extension AuthMethodListCoordinator: AuthMethodListCoordinating {
    func goToLoginWithPassword() {
        push(.home)
    }
}
