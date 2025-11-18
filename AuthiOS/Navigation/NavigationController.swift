import Combine
import SwiftUI

final class NavigationController<Route: Routable>: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentedRoute: Route?

    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func present(_ route: Route) {
        presentedRoute = route
    }

    func dismiss() {
        presentedRoute = nil
    }
}
