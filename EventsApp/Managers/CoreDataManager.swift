import UIKit
import CoreData

final class CoreDataManager {

    static let shared = CoreDataManager()
    private init() {}

    private lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EventsApp")
        persistentContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()

    private var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    private func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")

        do {
            try moc.save()
        } catch {
            print(error)
        }
    }

    private func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            return try moc.fetch(fetchRequest)
        } catch {
            print(error)
            return []
        }
    }

}
