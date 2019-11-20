//
//  SingleWorkoutViewController.swift
//  FitForFree
//
//  Created by Alumno on 10/25/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class SingleWorkoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StartedWorkoutState {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbWorkoutDescription: UILabel!
    @IBOutlet weak var tableExcercises: UITableView!
    
    var workoutData : WorkoutData!
    var workoutState : WorkoutState = WorkoutState()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableExcercises.dataSource = self
        tableExcercises.delegate = self
        
        title = workoutData.name
        lbTitle.text = workoutData.name
        lbWorkoutDescription.text = workoutData.workoutDescription
    }
    
    // MARK: - Table View functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutData.excerciseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "WorkoutInfoExcerciseCell", for: indexPath)
        
        let index = indexPath.row
        
        celda.textLabel?.text = workoutData.excerciseList[index].name
            
        return celda
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Los ejercicios de la rutina"
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToExcercise" {
            let excerciseView = segue.destination as! ExcerciseViewController
            
            let currentIndex = tableExcercises.indexPathForSelectedRow?.row
            excerciseView.excerciseData = workoutData.excerciseList[currentIndex!]
            
        }
        else if segue.identifier == "segueRunWorkout" {
            let warmupView = segue.destination as! WarmupViewController
            
            warmupView.workoutDelegate = self
            warmupView.excerciseData = workoutData.excerciseList[0]
            
            workoutState.numExcercise = 0
            workoutState.currentState = .WARMUP
            
            warmupView.workoutState = workoutState
        }
    }
    
    // MARK: - Workout State functions
    func finishedExcercise(excercise number: Int) -> WorkoutState {
        if workoutState.currentState == AppState.WARMUP {
            workoutState.currentState = .EXCERCISE
            workoutState.numExcercise = 0
        }
        else if (workoutState.currentState == AppState.EXCERCISE) && (number >= workoutData.excerciseList.count) {
            workoutState.currentState = .COOLDOWN
            workoutState.numExcercise = number
        }
        else {
            workoutState.numExcercise = number + 1
        }
        return workoutState
    }
       
    func getNextExcerciseData() -> ExcerciseData {
        let nextExcercise : ExcerciseData = workoutData.excerciseList[workoutState.numExcercise]
        
        return nextExcercise
    }
    
    func isThisLastExcercise(num: Int) -> Bool {
        return num == workoutData.excerciseList.count
    }
    func resetWorkoutProgress() -> Void {
        workoutState = WorkoutState()
        workoutState.currentState = .NOT_STARTED
    }
    func finishWorkout() -> Void {
        StoreWorkoutDataInStorage.saveDailyData(workout: workoutData)
    }
}
