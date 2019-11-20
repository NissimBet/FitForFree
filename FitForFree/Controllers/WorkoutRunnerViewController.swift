//
//  WorkoutRunnerViewController.swift
//  FitForFree
//
//  Created by Alumno on 10/25/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

protocol StartedWorkoutState {
    func finishedExcercise(excercise number: Int) -> WorkoutState
    func getNextExcerciseData() -> ExcerciseData
    func isThisLastExcercise(num: Int) -> Bool
    func resetWorkoutProgress() -> Void
    func finishWorkout() -> Void
}

class WorkoutRunnerViewController: UIViewController {

    @IBOutlet weak var imgExcIMage: UIImageView!
    @IBOutlet weak var lbExcNAme: UILabel!
    @IBOutlet weak var lbExcDesc: UILabel!
    @IBOutlet weak var lbTimer: UILabel!
    @IBOutlet weak var btnPause: UIButton!
    
    var workoutDelegate : StartedWorkoutState!
    var workoutState : WorkoutState!
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
            runTimer()
        }
        
        // propio boton para cancelar o no el workout
        navigationItem.hidesBackButton = true
        let newButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backActionInterceptor(sender:)))
        navigationItem.rightBarButtonItem = newButton
        
        reloadData(with: excerciseData)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if timer != nil {
            timer?.invalidate()
        }
    }
    
    @IBAction func backActionInterceptor(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Cancelar Rutina", message: "Si regresas la rutina se cancelará", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            self.workoutDelegate.resetWorkoutProgress()
            self.navigationController?.popToViewController((self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)! - 3])!, animated: true)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func reloadData(with nextData : ExcerciseData) {
        //imgExcIMage.image = Utils.getImage()
        lbExcDesc.text = excerciseData.excerciseDescription
        lbExcNAme.text = excerciseData.name
        downloadImage(with: URL(string: excerciseData.videoURL)!)
        
        currentTime = excTime
        resetTimer()
        
        lbTimer.text = "\(currentTime)"
    }
    
    func finishExcercise() {
        workoutState = workoutDelegate.finishedExcercise(excercise: currentExc)
        currentExc += 1
        isLast = workoutDelegate.isThisLastExcercise(num: currentExc)
        
        if !isLast {
            let nextExc = workoutDelegate.getNextExcerciseData()
            excerciseData = nextExc
            reloadData(with: excerciseData)
        }
        else {
            workoutDelegate.finishWorkout()
            performSegue(withIdentifier: "segueToCooldown", sender: self)
        }
    }
    
    // MARK: - functions for timer management
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
            finishExcercise()
            resetTimer()
        }
    }
    
    @IBAction func doPauseTimer(_ sender: Any) {
        pauseTimer()
    }
    
    func downloadImage(with url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.imgExcIMage.image = UIImage.gif(data: data!)
            }
        }.resume()
    }
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
*/
}
