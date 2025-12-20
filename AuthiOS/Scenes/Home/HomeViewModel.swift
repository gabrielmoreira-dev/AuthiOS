import Combine

extension HomeViewModel.Constants {
    static let navigationTitle = "Home"
    static let text = "Hello World!"
    static let buttonTitle = "Sign Out"
}

@MainActor
final class HomeViewModel: ObservableObject {
    fileprivate enum Constants {}
    private let coordinator: HomeCoordinating

    init(coordinator: HomeCoordinating) {
        self.coordinator = coordinator
    }

    var navigationTitle: String {
        Constants.navigationTitle
    }

    var text: String {
        Constants.text
    }

    var buttonTitle: String {
        Constants.buttonTitle
    }

    func signOut() {
        coordinator.exitFlow()
    }
}
