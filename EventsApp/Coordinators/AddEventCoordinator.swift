import UIKit

final class AddEventCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private var modalNavigationController: UINavigationController?

    var parentCoordinator: EventListCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        modalNavigationController = UINavigationController()
        let addEventViewController: AddEventViewController = .instantiate()
        modalNavigationController?.setViewControllers([addEventViewController], animated: false)
        let addEventViewModel = AddEventViewModel()
        addEventViewController.viewModel = addEventViewModel
        addEventViewModel.coordinator = self
        if let modalNavigationController = modalNavigationController {
            navigationController.present(modalNavigationController, animated: true, completion: nil)
        }
    }

    func didFihishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }

    deinit {
        print("add event coordinator off")
    }
}
