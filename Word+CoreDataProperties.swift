//
//  Word+CoreDataProperties.swift
//  pockeTango
//
//  Created by NY on 2022/02/13.
//
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var x: String?
    @NSManaged public var y: String?
    @NSManaged public var userregisteredbook: UserRegisterdBook?

}

extension Word : Identifiable {

}
