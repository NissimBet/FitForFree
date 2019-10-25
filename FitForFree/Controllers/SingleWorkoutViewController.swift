//
//  SingleWorkoutViewController.swift
//  FitForFree
//
//  Created by Alumno on 10/25/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class SingleWorkoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbWorkoutDescription: UILabel!
    @IBOutlet weak var tableExcercises: UITableView!
    
    var workoutData : WorkoutData!

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToExcercise" {
            let excerciseView = segue.destination as! ExcerciseViewController
            
            let currentIndex = tableExcercises.indexPathForSelectedRow?.row
            excerciseView.excerciseData = workoutData.excerciseList[currentIndex!]
            
        }
        else if segue.identifier == "segueRunWorkout" {
            
        }
    }
}
