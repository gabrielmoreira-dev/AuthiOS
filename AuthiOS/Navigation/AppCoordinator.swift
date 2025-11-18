import Combine
import SwiftUI

protocol AppCoordinating<Route>: AnyObject, Coordinator where Route: Routable {
    var childCoordinator: (any Coordinator)? { get set }
}

final class AppCoordinator<Route: Routable>: ObservableObject , AppCoordinating {
    @Published var navigationController = NavigationController<Route>()
    var childCoordinator: (any Coordinator)?
    var delegate: (any CoordinatorDelegate)?

    var view: some View {
        if let childCoordinator {
            AnyView(childCoordinator.view)
        } else {
            EmptyView()
        }
    }

    func finish() { }
}
