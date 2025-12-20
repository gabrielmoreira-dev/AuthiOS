import SwiftUI

struct AuthMethodListView: View {
    @StateObject var viewModel: AuthMethodListViewModel

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
        AuthMethodListCoordinator(
            navigationController: .init()
        ).view
    }
}
