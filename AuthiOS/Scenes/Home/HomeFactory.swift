import SwiftUI

enum HomeFactory {
    @ViewBuilder
    static func build(navigationController: NavigationController<AppRoute>) -> some View {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        let viewModel = HomeViewModel(coordinator: coordinator)
        HomeView(viewModel: viewModel)
    }
}
