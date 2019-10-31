//
//  SavedWorkout+CoreDataProperties.swift
//  FitForFree
//
//  Created by Alumno on 10/31/19.
//  Copyright © 2019 Rick. All rights reserved.
//
//

import Foundation
import CoreData


extension SavedWorkout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedWorkout> {
        return NSFetchRequest<SavedWorkout>(entityName: "SavedWorkout")
    }

    @NSManaged public var name: String?
    @NSManaged public var day: Date?
    @NSManaged public var calories: Double

}
