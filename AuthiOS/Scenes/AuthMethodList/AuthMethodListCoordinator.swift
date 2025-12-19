import Combine
import SwiftUI

protocol AuthMethodListCoordinating {
    func goToLoginWithPassword()
}

enum AuthMethodListRoute: String, Routable {
    case home

    var id: String { rawValue }
}

final class AuthMethodListCoordinator: FeatureCoordinatorType {
    @Published var navigationController: NavigationController<AppRoute>
    var delegate: (any CoordinatorDelegate)?

    @MainActor
    @ViewBuilder
    var view: some View {
        AuthMethodListView(viewModel: AuthMethodListViewModel(coordinator: self))
    }

    init(navigationController: NavigationController<AppRoute>) {
        self.navigationController = navigationController
    }

    func finish() { }
}

extension AuthMethodListCoordinator: AuthMethodListCoordinating {
    func goToLoginWithPassword() {
        push(.home)
    }
}
