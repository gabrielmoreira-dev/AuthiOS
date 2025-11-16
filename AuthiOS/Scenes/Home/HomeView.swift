import SwiftUI

struct HomeView: View {
    private let viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List(viewModel.items) { item in
            Text(item.rawValue)
                .onTapGesture {
                    viewModel.didSelectOption(item)
                }
        }
        .navigationTitle("Authentication")
    }
}

#Preview {
    NavigationStack {
        HomeCoordinator().view()
    }
}
