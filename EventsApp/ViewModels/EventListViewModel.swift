import Foundation

final class EventListViewModel {
    let title = "Events"
    var coordinator: EventListCoordinator?

    func tapAddEvent(){
        coordinator?.startAddEvent()
    }
}
