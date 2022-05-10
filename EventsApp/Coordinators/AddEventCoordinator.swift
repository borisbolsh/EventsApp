import UIKit

final class AddEventCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private var modalNavigationController: UINavigationController?
    private var completion: (UIImage) -> Void = { _ in }

    var parentCoordinator: EventListCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        modalNavigationController = UINavigationController()
        let addEventViewController: AddEventViewController = .instantiate()
        modalNavigationController?.setViewControllers([addEventViewController], animated: false)
        let addEventViewModel = AddEventViewModel(cellBuilder: EventsCellBuilder(), coreDataManager: CoreDataManager.shared)
        addEventViewController.viewModel = addEventViewModel
        addEventViewModel.coordinator = self
        if let modalNavigationController = modalNavigationController {
            navigationController.present(modalNavigationController, animated: true, completion: nil)
        }
    }

    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }

    func didFinishSaveEvent() {
        navigationController.dismiss(animated: true, completion: nil)
    }

    func showImagePicker(completion: @escaping (UIImage) -> Void) {
       guard let modalNavigationController = modalNavigationController else { return }
       self.completion = completion
       let imagePickerCoordinator = ImagePickerCoordinator(navigationController: modalNavigationController)
       imagePickerCoordinator.onFinishPicking = { [weak self] image in
           self?.completion(image)
           self?.modalNavigationController?.dismiss(animated: true, completion: nil)
       }
       imagePickerCoordinator.parentCoordinator = self
       childCoordinators.append(imagePickerCoordinator)
       imagePickerCoordinator.start()
   }

    deinit {
        print("add event coordinator off")
    }
}
