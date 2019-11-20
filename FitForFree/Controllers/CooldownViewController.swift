//
//  CooldownViewController.swift
//  FitForFree
//
//  Created by Alumno on 11/20/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class CooldownViewController: UIViewController {

    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var lbTimer: UILabel!
    
    var timer : Timer? = nil
    var isTimerPaused : Bool! = false
    var excTime : Int! = 15
    var currentTime : Int = 0
    var isTimerRunning : Bool = false
    
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
        performSegue(withIdentifier: "segueToSuccess", sender: self)
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
        if segue.identifier == "segueToSuccess" {
            let vista = segue.destination as! FinishedWorkoutViewController
            vista.calories = 20
        }
    }
    

}
