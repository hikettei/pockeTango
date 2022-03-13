//
//  UserRegisterdBook+CoreDataProperties.swift
//  pockeTango
//
//  Created by NY on 2022/02/13.
//
//

import Foundation
import CoreData


extension UserRegisterdBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserRegisterdBook> {
        return NSFetchRequest<UserRegisterdBook>(entityName: "UserRegisterdBook")
    }

    @NSManaged public var folderName: String?
    @NSManaged public var word: NSSet?

}

// MARK: Generated accessors for word
extension UserRegisterdBook {

    @objc(addWordObject:)
    @NSManaged public func addToWord(_ value: Word)

    @objc(removeWordObject:)
    @NSManaged public func removeFromWord(_ value: Word)

    @objc(addWord:)
    @NSManaged public func addToWord(_ values: NSSet)

    @objc(removeWord:)
    @NSManaged public func removeFromWord(_ values: NSSet)

}

extension UserRegisterdBook : Identifiable {

}
