//
//  ExcerciseData.swift
//  FitForFree
//
//  Created by Alumno on 10/21/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class WorkoutData: NSObject {
    var name: String!
    var workoutDescription: String!
    var excerciseList: [ExcerciseData]!
    
    init(name: String, description: String, excerciseList: [ExcerciseData]) {
        self.name = name
        self.workoutDescription = description
        self.excerciseList = excerciseList
    }
    
}
