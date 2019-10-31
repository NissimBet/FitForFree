//
//  WorkoutHistoryViewController.swift
//  FitForFree
//
//  Created by Alumno on 10/31/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class WorkoutHistoryViewController: UIViewController {

    @IBOutlet weak var lbWeekBurns: UILabel!
    
    var allWorkouts = [SavedWorkout]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        allWorkouts = StoreWorkoutDataInStorage.loadAllData()
        let today = Date()
        
        let weeksData = allWorkouts.filter { (data) in
            return Calendar.current.dateComponents([.day], from: data.day, to: today).day! <= 7
        }
        
        lbWeekBurns.text = "Esta semana haz quemado " + String(format: "%.3f", weeksData.reduce(0) { acc, data in acc + data.calories }) + " calorias"
    }
    
    @IBAction func doDoneReturn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
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
