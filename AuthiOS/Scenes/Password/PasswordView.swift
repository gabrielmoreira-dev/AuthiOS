import SwiftUI

extension PasswordView.Constants {
    static let verticalMargin = 32.0
    static let horizontalMargin = 16.0
    static let formSpacing = 20.0
}

struct PasswordView: View {
    fileprivate enum Constants {}
    @StateObject var viewModel: PasswordViewModel

    var body: some View {
        VStack(spacing: Constants.formSpacing) {
            if let error = viewModel.loginError {
                Text(error)
                    .foregroundColor(.red)
            }
            
            TextField(viewModel.emailTitle, text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField(viewModel.passwordTitle, text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            Button(action: viewModel.login) {
                VStack {
                    if viewModel.isLoggingIn {
                        ProgressView()
                    } else {
                        Text(viewModel.buttonTitle)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isButtonDisabled)
        }
        .padding(.vertical, Constants.verticalMargin)
        .padding(.horizontal, Constants.horizontalMargin)
        .navigationTitle(viewModel.navigationTitle)
    }
}

#Preview {
    NavigationStack {
        PasswordCoordinator(navigationController: .init()).view
    }
}

