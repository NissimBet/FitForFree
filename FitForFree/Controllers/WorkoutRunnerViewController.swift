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
    func isThisLastExcercise(num: Int) -> Bool
}

class WorkoutRunnerViewController: UIViewController {

    @IBOutlet weak var imgExcIMage: UIImageView!
    @IBOutlet weak var lbExcNAme: UILabel!
    @IBOutlet weak var lbExcDesc: UILabel!
    @IBOutlet weak var lbTimer: UILabel!
    
    
    var workoutDelegate : StartedWorkoutState!
    var currentExc : Int = 0
    var excerciseData : ExcerciseData!
    var timer : Timer? = nil
    var isTimerPaused : Bool! = false
    var excTime : Int!
    var currentTime : Int = 0
    var isTimerRunning : Bool = false
    var isLast : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        if !isTimerRunning {
            print("A")
            runTimer()
        }
        reloadData(with: excerciseData)
    }
    
    func reloadData(with nextData : ExcerciseData) {
        imgExcIMage.image = UIImage(named: "noImage")
        lbExcDesc.text = excerciseData.excerciseDescription
        lbExcNAme.text = excerciseData.name
        
        currentTime = excTime
        resetTimer()
        
        lbTimer.text = "\(currentTime)"
    }
    
    func finishExcercise() {
        workoutDelegate.finishedExcercise(excercise: currentExc)
        let nextExc = workoutDelegate.getNextExcerciseData()
        excerciseData = nextExc
        isLast = workoutDelegate.isThisLastExcercise(num: currentExc)
        
        if !isLast {
            reloadData(with: excerciseData)
        }
    }
    
    // MARK: - functions for timer management
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    func pauseTimer() {

        if isTimerPaused {
            runTimer()
            isTimerPaused = false
        }
        else {
            if timer != nil {
                timer!.invalidate()
            }
           isTimerPaused = true
        }
    }
    
    func resetTimer() {
        if timer != nil {
            timer!.invalidate()
        }
        
        currentTime = excTime
        lbTimer.text = "\(currentTime)"
        
        isTimerRunning = false
        
        runTimer()
    }
    
    @IBAction func updateTimer() {
        currentTime -= 1
        lbTimer.text = "\(currentTime)"
        if currentTime <= 0 {
            finishExcercise()
            resetTimer()
        }
    }
    
    @IBAction func doPauseTimer(_ sender: Any) {
        pauseTimer()
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
