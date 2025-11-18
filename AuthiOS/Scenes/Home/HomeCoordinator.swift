protocol HomeCoordinating {
    func exitFlow()
}

final class HomeCoordinator {
    private weak var appCoordinator: (any AppCoordinating<AppRoute>)?

    init(appCoordinator: (any AppCoordinating<AppRoute>)?) {
        self.appCoordinator = appCoordinator
    }
}

extension HomeCoordinator: HomeCoordinating {
    func exitFlow() {
        appCoordinator?.popToRoot()
    }
}
