import SwiftUI

enum HomeFactory {
    @ViewBuilder
    static func build(appCoordinator: (any AppCoordinating<AppRoute>)? = nil) -> some View {
        let coordinator = HomeCoordinator(appCoordinator: appCoordinator)
        let viewModel = HomeViewModel(coordinator: coordinator)
        HomeView(viewModel: viewModel)
    }
}
