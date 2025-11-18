import SwiftUI

extension HomeView.Constants {
    static let verticalMargin = 32.0
    static let horizontalMargin = 16.0
}

struct HomeView: View {
    fileprivate enum Constants {}
    @State private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.text)
            Spacer()
            Button(action: viewModel.signOut) {
                Text(viewModel.buttonTitle)
            }
        }
        .padding(.vertical, Constants.verticalMargin)
        .padding(.horizontal, Constants.horizontalMargin)
        .navigationTitle(viewModel.navigationTitle)
    }
}

#Preview {
    NavigationStack {
        HomeCoordinator(
            navigationController: NavigationController<AppRoute>()
        ).view
    }
}
