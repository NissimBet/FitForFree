//
//  WarmupViewController.swift
//  FitForFree
//
//  Created by Alumno on 11/20/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class WarmupViewController: UIViewController {

    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var lbTimer: UILabel!
    
    var workoutDelegate : StartedWorkoutState!
    var workoutState : WorkoutState!
    var timer : Timer? = nil
    var isTimerPaused : Bool! = false
    var excTime : Int! = 15
    var currentTime : Int = 0
    var isTimerRunning : Bool = false
    var excerciseData : ExcerciseData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        reloadData()
        
        if !isTimerRunning {
            runTimer()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if timer != nil {
            timer?.invalidate()
        }
    }
    
    func finishWarmup() {
        performSegue(withIdentifier: "segueContinueToWorkout", sender: self)
        workoutState = workoutDelegate.finishedExcercise(excercise: 0)
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    func pauseTimer() {
        if isTimerPaused {
            btnPause.setTitle("Pausa", for: .normal)
            runTimer()
            isTimerPaused = false
        }
        else {
            if timer != nil {
                timer!.invalidate()
            }
            isTimerPaused = true
            btnPause.setTitle("Continuar", for: .normal)
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
            finishWarmup()
            resetTimer()
        }
    }
    
    @IBAction func doPauseTimer(_ sender: Any) {
        pauseTimer()
    }
    
    func reloadData() {
        currentTime = excTime
        resetTimer()
        
        lbTimer.text = "\(currentTime)"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueContinueToWorkout" {
            let workoutRunner = segue.destination as! WorkoutRunnerViewController
            
            workoutRunner.workoutDelegate = workoutDelegate
            workoutRunner.excerciseData = excerciseData
            workoutRunner.excTime = 5
            workoutRunner.currentExc = 0
            
            workoutState.numExcercise = 0
            workoutState.currentState = .EXCERCISE
            
            workoutRunner.workoutState = workoutState
        }
    }

}
