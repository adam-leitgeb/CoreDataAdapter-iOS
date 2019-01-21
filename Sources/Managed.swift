//
//  Managed.swift
//  CoreDataAdapter
//
//  Created by Adam Leitgeb on 21/01/2019.
//

import CoreData

protocol Managed: class, NSFetchRequestResult {
    associatedtype ManagedObject: NSManagedObject

    static var entityName: String { get }
    static var fetchRequest: NSFetchRequest<ManagedObject> { get }
    static var defaultSortDescriptors: [NSSortDescriptor] { get }
}

extension Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }

    static var fetchRequest: NSFetchRequest<Self> {
        return NSFetchRequest<Self>(entityName: entityName)
    }

    static var sortedFetchRequest: NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors

        return request
    }
}

extension Managed where Self: NSManagedObject {
    static var entityName: String {
        guard let entityName = entity().name else {
            fatalError("Managed: Unable to read entity name.")
        }
        return entityName
    }
}
