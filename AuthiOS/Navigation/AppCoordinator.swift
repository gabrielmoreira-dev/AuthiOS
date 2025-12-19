import Combine
import SwiftUI

protocol AppCoordinating: AnyObject, CoordinatorType {
    var childCoordinator: (any CoordinatorType)? { get set }
}

final class AppCoordinator<Route: Routable>: ObservableObject, AppCoordinating {
    @Published var navigationController = NavigationController<Route>()
    var childCoordinator: (any CoordinatorType)?
    weak var delegate: (any CoordinatorDelegate)?

    var view: some View {
        if let childCoordinator {
            AnyView(childCoordinator.view)
        } else {
            EmptyView()
        }
    }

    func finish() { }
}
