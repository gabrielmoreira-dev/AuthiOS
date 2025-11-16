extension HomeViewModel {
    enum Item: String, CaseIterable, Identifiable {
        case password = "Login with Password"

        var id: String { rawValue }
    }
}

final class HomeViewModel {
    private let coordinator: HomeCoordinatorType

    init(coordinator: HomeCoordinatorType) {
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
