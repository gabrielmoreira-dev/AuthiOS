protocol HomeCoordinating {
    func exitFlow()
}

final class HomeCoordinator: Coordinator {
    var navigationController: NavigationController<AppRoute>
    var delegate: (any CoordinatorDelegate)?

    init(navigationController: NavigationController<AppRoute>) {
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
