//
//  WorkoutState.swift
//  FitForFree
//
//  Created by Alumno on 10/25/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class WorkoutState: NSObject {
    var numExcercise: Int!
    var currentState: AppState! = .NOT_STARTED
}

enum AppState {
    case NOT_STARTED
    case EXCERCISE
    case COOLDOWN
    case WARMUP
    case FINISHED
}
