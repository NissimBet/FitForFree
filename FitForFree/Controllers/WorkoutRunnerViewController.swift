//
//  WorkoutRunnerViewController.swift
//  FitForFree
//
//  Created by Alumno on 10/25/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

protocol StartedWorkoutState {
    func finishedExcercise(excercise number: Int) -> Void
    func getNextExcerciseData() -> ExcerciseData
}

class WorkoutRunnerViewController: UIViewController {

    var workoutDelegate : StartedWorkoutState!
    var currentExc : Int!
    var excerciseData : ExcerciseData!
    var timer : Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: TimeInterval(30.0), target: self, selector: #selector(doFinishExcercise), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func doFinishExcercise() {
        workoutDelegate.finishedExcercise(excercise: currentExc)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
