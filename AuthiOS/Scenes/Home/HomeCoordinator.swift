import SwiftUI

protocol HomeCoordinating {
    func exitFlow()
}

enum HomeRoute: String, Routable {
    case loginWithPassword

    var id: String { rawValue }
}

final class HomeCoordinator: Coordinator {
    var navigationController: NavigationController<HomeRoute>
    var delegate: (any CoordinatorDelegate)?

    @MainActor
    @ViewBuilder
    var view: some View {
        RootView(navigationController: self.navigationController, destination: getDestination) {
            HomeView(viewModel: HomeViewModel(coordinator: self))
        }
    }

    init(navigationController: NavigationController<HomeRoute> = .init()) {
        self.navigationController = navigationController
    }

    @MainActor
    @ViewBuilder
    func getDestination(_ route: HomeRoute) -> some View {
        switch route {
        case .loginWithPassword:
            HomeCoordinator(navigationController: .init()).view
        }
    }

    func finish() {
        
    }
}

extension HomeCoordinator: HomeCoordinating {
    func exitFlow() {
        popToRoot()
    }
}
