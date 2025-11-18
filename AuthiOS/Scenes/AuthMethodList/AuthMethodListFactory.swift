import SwiftUI

enum AuthMethodListFactory {
    @ViewBuilder
    static func build(navigationController: NavigationController<AppRoute>) -> some View {
        let coordinator = AuthMethodListCoordinator(navigationController: navigationController)
        let viewModel = AuthMethodListViewModel(coordinator: coordinator)
        AuthMethodListView(viewModel: viewModel)
    }
}
