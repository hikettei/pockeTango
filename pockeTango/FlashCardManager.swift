//
//  FlashCardManager.swift
//  pockeTango
//
//  Created by NY on 2022/02/13.
//

import Foundation
import CoreData
import UIKit

class FlashCardManager {
    public static var persistentContainer: NSPersistentCloudKitContainer! = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    static func getAllFolders() -> [UserRegisterdBook] {
        
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserRegisterdBook")
        
        do {
            return try context.fetch(request) as! [UserRegisterdBook]
        }
        
        catch {
            fatalError()
        }
    }
    
    static func getAllFoldersName() -> [String] {
        return getAllFolders().map{ $0.folderName! }
    }
    
    static func registerNewBook(foldername:String) -> UserRegisterdBook {
        let context = persistentContainer.viewContext
        let book = NSEntityDescription.insertNewObject(forEntityName: "UserRegisterdBook", into: context) as! UserRegisterdBook
        book.folderName = foldername
        return book
    }
    
    static func registerNewWord(book:UserRegisterdBook, x:String, y:String) -> Word {
        let context = persistentContainer.viewContext
        let word = NSEntityDescription.insertNewObject(forEntityName: "Word", into: context) as! Word
        
        book.addToWord(word)
        
        word.x = x
        word.y = y
        
        return word
        
    }
    
    static func getWords(only book: UserRegisterdBook) -> [Word] {
        
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Word")
        request.predicate = NSPredicate(format: "book == %@", book)
        
        do {
            let book = try context.fetch(request) as! [Word]
            return book
        }
        catch {
            fatalError()
        }
    }
    
    static func save() {
        persistentContainer.saveContext()
    }
}
