import Combine
import SwiftUI

protocol PasswordCoordinatorType {
    func goHome()
}

final class PasswordCoordinator: FeatureCoordinatorType {
    @Published var navigationController: NavigationController<AppRoute>
    weak var delegate: (any CoordinatorDelegate)?

    @MainActor
    @ViewBuilder
    var view: some View {
        PasswordView(viewModel: PasswordViewModel(coordinator: self))
    }

    init(navigationController: NavigationController<AppRoute>) {
        self.navigationController = navigationController
    }

    func finish() { }
}

extension PasswordCoordinator: PasswordCoordinatorType {
    func goHome() {
        push(.home)
    }
}
