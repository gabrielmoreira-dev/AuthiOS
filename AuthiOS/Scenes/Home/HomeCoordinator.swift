import SwiftUI

protocol HomeCoordinating {
    func exitFlow()
}

final class HomeCoordinator: Coordinator {
    var navigationController: NavigationController<AppRoute>
    var delegate: (any CoordinatorDelegate)?

    @MainActor
    @ViewBuilder
    var view: some View {
        HomeView(viewModel: HomeViewModel(coordinator: self))
    }

    init(navigationController: NavigationController<AppRoute> = .init()) {
        self.navigationController = navigationController
    }

    func finish() {
        
    }
}

extension HomeCoordinator: HomeCoordinating {
    func exitFlow() {
        popToRoot()
    }
}
