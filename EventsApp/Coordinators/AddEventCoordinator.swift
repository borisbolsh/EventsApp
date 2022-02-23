import UIKit

final class AddEventCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
