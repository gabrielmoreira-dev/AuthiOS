import SwiftUI

enum AuthMethodListFactory {
    @ViewBuilder
    static func build(appCordinator: (any AppCoordinating<AppRoute>)? = nil) -> some View {
        let coordinator = AuthMethodListCoordinator(appCoordinator: appCordinator)
        let viewModel = AuthMethodListViewModel(coordinator: coordinator)
        let view = AuthMethodListView(viewModel: viewModel)
        AnyView(view)
    }
}
