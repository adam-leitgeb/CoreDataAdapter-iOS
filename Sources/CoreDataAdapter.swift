//
//  CoreDataAdapter.swift
//  CoreDataAdapter
//
//  Created by Adam Leitgeb on 21/01/2019.
//

import CoreData

final class PersistenceAdapter {

    // MARK: - Properties

    var managedObjectContext: NSManagedObjectContext

    // MARK: - Initialization

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    // MARK: - Actions

    func fetch<A: NSManagedObject>() -> [A] where A: Managed {
        guard let managedObjects = try? managedObjectContext.fetch(A.fetchRequest), let objects = managedObjects as? [A] else {
            fatalError("PersistenceAdapter is unable to fetch object \(String(describing: A.self))")
        }
        return objects
    }

    func createManagedObject<A>(type: A.Type, completion: @escaping (A) -> Void) where A: Managed {
        guard let object = NSEntityDescription.insertNewObject(forEntityName: A.entityName, into: managedObjectContext) as? A else {
            fatalError("Wrong object type")
        }

        completion(object)

        do {
            try managedObjectContext.save()
        } catch {
            fatalError("PersistenceAdapter: Saving object into the context failed. Set all required properties.")
        }
    }

    func deleteManagedObject(_ managedObject: NSManagedObject, completion: @escaping (CoreDataAdapterError?) -> Void) {
        guard let managedObjectContext = managedObject.managedObjectContext else {
            return
        }

        managedObjectContext.perform {
            managedObjectContext.delete(managedObject)
            self.saveOrRollbackToLastCommittedVersion(completion)
        }
    }

    // MARK: - Utilities

    private func saveOrRollbackToLastCommittedVersion(_ completion: @escaping (CoreDataAdapterError?) -> Void) {
        do {
            try managedObjectContext.save()
            completion(nil)
        } catch {
            managedObjectContext.rollback()
            completion(.removingFailed)
        }
    }
}
