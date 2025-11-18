import Combine

extension AuthMethodListViewModel {
    enum Item: String, CaseIterable, Identifiable {
        case password = "Login with Password"

        var id: String { rawValue }
    }
}

final class AuthMethodListViewModel: ObservableObject {
    private let coordinator: AuthMethodListCoordinating

    init(coordinator: AuthMethodListCoordinating) {
        self.coordinator = coordinator
    }

    var items: [Item] {
        Item.allCases
    }

    func didSelectOption(_ item: Item) {
        switch item {
        case .password:
            coordinator.goToLoginWithPassword()
        }
    }
}
