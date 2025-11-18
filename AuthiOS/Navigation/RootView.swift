import SwiftUI

struct RootView<Content, V, Route>: View where Content: View, V: View, Route: Routable {
    @EnvironmentObject var navigationController: NavigationController<Route>
    let destination: (Route) -> V
    let content: () -> Content

    var body: some View {
        NavigationStack(path: $navigationController.path) {
            content()
                .sheet(item: $navigationController.presentedRoute, content: destination)
                .navigationDestination(for: Route.self, destination: destination)
        }
    }
}
