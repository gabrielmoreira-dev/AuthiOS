import SwiftUI

struct RootView<Content, V, R>: View where Content: View, V: View, R: Route {
    @EnvironmentObject var coordinator: AppCoordinator<R>
    let destination: (R) -> V
    let content: () -> Content

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            content()
                .sheet(item: $coordinator.modal, content: destination)
                .navigationDestination(for: R.self, destination: destination)
        }
        .onAppear() {
            coordinator.start()
        }
    }
}
