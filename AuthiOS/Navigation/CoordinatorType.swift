import Combine
import SwiftUI

protocol CoordinatorType: AnyObject, CoordinatorDelegate {
    associatedtype Content: View

    @MainActor @ViewBuilder var view: Content { get }
    var delegate: CoordinatorDelegate? { get set }

    func finish()
}
