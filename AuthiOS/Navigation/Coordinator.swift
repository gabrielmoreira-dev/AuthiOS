import SwiftUI

protocol Coordinator: AnyObject, CoordinatorDelegate {
    associatedtype Route: Routable
    associatedtype Content: View

    var navigationController: NavigationController<Route> { get set }
    @MainActor @ViewBuilder var view: Content { get }
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
