//
//  Entry.swift
//  DiaryApp
//
//  Created by Raymond Choy on 1/5/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import MapKit

//This class represents the object in core data
public class Entry: NSManagedObject {

}

extension Entry {
    //Method to read data from core data and return the data sorted
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
    
    //Object attributes
    @NSManaged public var date: Date
    @NSManaged public var text: String
    @NSManaged public var image: NSData?
    @NSManaged public var mood: String?
    @NSManaged public var location: String?
}

extension Entry {
    //Computated property that returns the name of the class
    static var entityName: String {
        return String(describing: Entry.self)
    }
    
    
    @nonobjc class func createWith(text: String, image: UIImage?, mood: String?, location: String?, in context: NSManagedObjectContext) -> Entry {
        let entry = NSEntityDescription.insertNewObject(forEntityName: Entry.entityName, into: context) as! Entry
        
        entry.date = Date()
        
        if let image = image {
            entry.image = image.jpegData(compressionQuality: 1.0) as NSData?
        }
        
        entry.location = location
        entry.text = text
        entry.mood = mood
        
        return entry
    }
    
    @nonobjc class func update(_ entry: Entry, text: String, image: UIImage?, mood: String?, location: String?, in context: NSManagedObjectContext) -> Entry {
        
        if let image = image {
            entry.image = image.jpegData(compressionQuality: 1.0) as NSData?
        }
        
        entry.text = text
        entry.mood = mood
        entry.location = location
        
        return entry
    }
}

extension Entry {
    //Computated property that converts a NSData type to UIImage type and returns a UIImage
    var uiImage: UIImage {
        if let image = self.image{
            return UIImage(data: image as Data)!
        }
        return UIImage(named: "icn_picture")!
    }
    
}



