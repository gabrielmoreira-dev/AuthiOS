import SwiftUI

protocol AuthMethodListCoordinating {
    func goToLoginWithPassword()
}

enum AuthMethodListRoute: String, Routable {
    case home

    var id: String { rawValue }
}

final class AuthMethodListCoordinator: Coordinator {
    var navigationController: NavigationController<AuthMethodListRoute>
    var delegate: (any CoordinatorDelegate)?

    @MainActor
    @ViewBuilder
    var view: some View {
        RootView(navigationController: self.navigationController, destination: getDestination) {
            AuthMethodListView(viewModel: AuthMethodListViewModel(coordinator: self))
        }
    }

    init(navigationController: NavigationController<AuthMethodListRoute> = .init()) {
        self.navigationController = navigationController
    }

    @MainActor
    @ViewBuilder
    func getDestination(_ route: AuthMethodListRoute) -> some View {
        switch route {
        case .home:
            HomeCoordinator(navigationController: .init()).view
        }
    }

    func finish() {

    }
}

extension AuthMethodListCoordinator: AuthMethodListCoordinating {
    func goToLoginWithPassword() {
        push(.home)
    }
}
