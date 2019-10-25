//
//  WorkoutState.swift
//  FitForFree
//
//  Created by Alumno on 10/25/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class WorkoutState: NSObject {
    numExcercise: Int!
    currentState: State!
    
    enum States {
        EXCERCISE,
        COOLDOWN,
        WARMUP
    }
}
