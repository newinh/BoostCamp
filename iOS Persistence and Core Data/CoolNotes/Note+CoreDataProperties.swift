//
//  Note+CoreDataProperties.swift
//  CoolNotes
//
//  Created by 신승훈 on 2017. 2. 17..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var creationDate: NSDate?
    @NSManaged public var text: String?
    @NSManaged public var notebook: NoteBook?

}
