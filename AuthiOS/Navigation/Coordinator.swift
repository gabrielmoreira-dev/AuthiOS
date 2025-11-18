protocol Coordinator: AnyObject, CoordinatorDelegate {
    associatedtype Route: Routable

    var navigationController: NavigationController<Route> { get set }
    var delegate: CoordinatorDelegate? { get set }

    func finish()
}

extension Coordinator {
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
