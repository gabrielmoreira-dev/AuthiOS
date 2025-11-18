import SwiftUI

protocol AuthMethodListCoordinating {
    func goToLoginWithPassword()
}

final class AuthMethodListCoordinator: Coordinator {
    var navigationController: NavigationController<AppRoute>
    var delegate: (any CoordinatorDelegate)?

    @MainActor
    @ViewBuilder
    var view: some View {
        AuthMethodListView(viewModel: AuthMethodListViewModel(coordinator: self))
    }

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
