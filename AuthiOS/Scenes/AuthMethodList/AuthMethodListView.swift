import SwiftUI

struct AuthMethodListView: View {
    @State private var viewModel: AuthMethodListViewModel

    init(viewModel: AuthMethodListViewModel) {
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
        AuthMethodListFactory.build(navigationController: NavigationController<AppRoute>())
    }
}
