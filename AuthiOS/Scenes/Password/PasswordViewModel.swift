import Combine

extension PasswordViewModel.Constants {
    static let navigationTitle = "Password"
    static let emailTitle = "E-mail"
    static let passwordTitle = "Password"
    static let buttonTitle = "Login"
}

@MainActor
final class PasswordViewModel: ObservableObject {
    fileprivate enum Constants {}
    private let coordinator: PasswordCoordinatorType

    @Published var email = String()
    @Published var password = String()
    @Published var isLoggingIn = false
    @Published var loginError: String?

    init(coordinator: PasswordCoordinatorType) {
        self.coordinator = coordinator
    }

    var navigationTitle: String {
        Constants.navigationTitle
    }

    var emailTitle: String {
        Constants.emailTitle
    }

    var passwordTitle: String {
        Constants.passwordTitle
    }

    var buttonTitle: String {
        Constants.buttonTitle
    }

    var isButtonDisabled: Bool {
        isLoggingIn || email.isEmpty || password.isEmpty
    }

    func login() {
        
    }

    private func goHome() {
        coordinator.goHome()
    }
}
