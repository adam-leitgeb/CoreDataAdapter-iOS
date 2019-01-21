//
//  CoreDataAdapterError.swift
//  CoreDataAdapter
//
//  Created by Adam Leitgeb on 21/01/2019.
//

import Foundation

enum CoreDataAdapterError: Error {
    /// Adapter rolled back to the last commited version.
    case removingFailed
}
