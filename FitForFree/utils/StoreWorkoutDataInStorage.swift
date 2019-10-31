//
//  StoreWorkoutDataInStorage.swift
//  FitForFree
//
//  Created by Alumno on 10/29/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit
import CoreData

class StoreWorkoutDataInStorage: NSObject {
    static func saveDailyData(workout: WorkoutData) -> Void {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let progress = NSEntityDescription.entity(forEntityName: "SavedWorkout", in: context)!
        
        let today = Date()
        if let name = workout.name {
            do {
                let newProgress = NSManagedObject(entity: progress, insertInto: context)
                newProgress.setValue(today, forKey: "day")
                newProgress.setValue(name, forKey: "name")
                newProgress.setValue(30.0, forKey: "calories")
                
                try context.save()
            }
            catch let error as NSError {
                print("Error Saving. \(error)")
            }
        }
    }
    
    static func loadAllData() -> [NSManagedObject] {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedWorkout")
        
        do {
            let result = try managedContext.fetch(fetch) as! [NSManagedObject]
            return result
        }
        catch {
            print("Could not load data")
        }
        
        return [NSManagedObject]()
    }
}
