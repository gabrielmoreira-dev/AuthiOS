import Combine
import SwiftUI

protocol HomeCoordinating {
    func exitFlow()
}

final class HomeCoordinator: FeatureCoordinatorType {
    @Published var navigationController: NavigationController<AppRoute>
    weak var delegate: (any CoordinatorDelegate)?

    @MainActor
    @ViewBuilder
    var view: some View {
        HomeView(viewModel: HomeViewModel(coordinator: self))
    }

    init(navigationController: NavigationController<AppRoute>) {
        self.navigationController = navigationController
    }

    func finish() {
        
    }
}

extension HomeCoordinator: HomeCoordinating {
    func exitFlow() {
        popToRoot()
    }
}
