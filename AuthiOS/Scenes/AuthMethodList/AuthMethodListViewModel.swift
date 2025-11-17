import Combine

extension AuthMethodListViewModel {
    enum Item: String, CaseIterable, Identifiable {
        case password = "Login with Password"

        var id: String { rawValue }
    }
}

final class AuthMethodListViewModel: ObservableObject {
    private let coordinator: AuthMethodListCoordinatorType

    init(coordinator: AuthMethodListCoordinatorType) {
        self.coordinator = coordinator
    }

    var items: [Item] { Item.allCases }

    func didSelectOption(_ item: Item) {
        switch item {
        case .password:
            coordinator.goToLoginWithPassword()
        }
    }
}
