import Combine
import SwiftUI

protocol AppCoordinating<Route>: AnyObject {
    associatedtype Route

    func push(_ route: Route)
    func pop()
    func popToRoot()
    func present(_ route: Route)
    func dismiss()
}

final class AppCoordinator<R>: ObservableObject where R: Route {
    @Published var path = NavigationPath()
    @Published var modal: R?
}

extension AppCoordinator: Coordinator {
    func start() {
        path = NavigationPath()
    }
    
    func stop() { }
}

extension AppCoordinator: AppCoordinating {
    func push(_ route: R) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }

    func present(_ modal: R) {
        self.modal = modal
    }

    func dismiss() {
        modal = nil
    }
}
