//
//  Progress+CoreDataProperties.swift
//  FitForFree
//
//  Created by Alumno on 10/29/19.
//  Copyright © 2019 Rick. All rights reserved.
//
//

import Foundation
import CoreData


extension Progress {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Progress> {
        return NSFetchRequest<Progress>(entityName: "Progress")
    }

    @NSManaged public var day: Date
    @NSManaged public var calorias: Int16

}
