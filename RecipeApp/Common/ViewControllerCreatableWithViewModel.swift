import UIKit

protocol ViewControllerCreatableWithViewModel: AnyObject {
    associatedtype ViewModel

    static func createViewController() -> Self

    var viewModel: ViewModel! { get set }

    static func create(viewModel: ViewModel) -> Self
}

extension ViewControllerCreatableWithViewModel {
    static func create(viewModel: ViewModel) -> Self {
        let viewController = createViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
