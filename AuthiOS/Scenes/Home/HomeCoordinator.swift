import SwiftUI

protocol HomeCoordinatorType {
    @ViewBuilder func view() -> AnyView
    func goToLoginWithPassword()
}

extension HomeCoordinator {
    enum Route: Hashable {
        case loginWithPassword
    }
}

final class HomeCoordinator: HomeCoordinatorType {
    private var path: NavigationPath

    init(path: NavigationPath = .init()) {
        self.path = path
    }

    @ViewBuilder
    func view() -> AnyView {
        let viewModel = HomeViewModel(coordinator: self)
        let view = HomeView(viewModel: viewModel)
            .navigationDestination(for: Route.self, destination: getDestination)
        AnyView(view)
    }

    func goToLoginWithPassword() {
        path.append(Route.loginWithPassword)
    }

    private func getDestination(route: Route) -> some View {
        switch route {
        case .loginWithPassword:
            Text("Test")
        }
    }
}
