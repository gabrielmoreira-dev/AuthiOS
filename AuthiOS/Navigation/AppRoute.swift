enum AppRoute: String, Routable {
    case home
    case loginWithPassword

    var id: String { rawValue }
}
