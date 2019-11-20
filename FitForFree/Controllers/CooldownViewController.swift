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
    @IBOutlet weak var coolDownImage: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var timer : Timer? = nil
    var isTimerPaused : Bool! = false
    var excTime : Int! = 15
    var currentTime : Int = 0
    var isTimerRunning : Bool = false
    
    var coolDownGifUrl = URL(string: "https://media1.giphy.com/media/xUPGcxoBFqr2CJy5sA/giphy.gif?cid=790b76118ea3730fa92af721333ae1167c2f96d8176b855a&rid=giphy.gif")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        downloadImage(with: coolDownGifUrl!)
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
    
    func downloadImage(with url: URL) {
        spinner(shouldSpin: true)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.coolDownImage.image = UIImage.gif(data: data!)
                self.spinner(shouldSpin: false)
            }
        }.resume()
    }
    
    func spinner(shouldSpin status: Bool){
        if status == true {
            spinner.isHidden = false
            spinner.startAnimating()
        } else {
            spinner.isHidden = true
            spinner.stopAnimating()
        }
    }

}
