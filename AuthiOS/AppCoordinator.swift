import SwiftUI

final class AppCoordinator {
    var childCoordinator: HomeCoordinatorType?

    func view() -> some View {
        childCoordinator?.view()
    }
}
