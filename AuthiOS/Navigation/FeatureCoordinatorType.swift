protocol FeatureCoordinatorType: CoordinatorType {
    associatedtype Route: Routable
    
    var navigationController: NavigationController<Route> { get set }
}

extension FeatureCoordinatorType {
    func push(_ route: Route) {
        navigationController.push(route)
    }

    func pop() {
        navigationController.pop()
    }

    func popToRoot() {
        navigationController.popToRoot()
    }

    func present(_ route: Route) {
        navigationController.present(route)
    }

    func dismiss() {
        navigationController.dismiss()
    }
}
