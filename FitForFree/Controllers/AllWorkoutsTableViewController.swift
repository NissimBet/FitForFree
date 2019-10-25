//
//  AllWorkoutsTableViewController.swift
//  FitForFree
//
//  Created by Alumno on 10/25/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class AllWorkoutsTableViewController: UITableViewController {

    var allWorkouts = [WorkoutData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Nuestros Workouts"
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allWorkouts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllWorkoutsSingleCell", for: indexPath)
        
        let index = indexPath.row
        cell.textLabel?.text = allWorkouts[index].name
        

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToWorkout" {
            let workoutView = segue.destination as! SingleWorkoutViewController
            
            let currentSelectedIndex = tableView.indexPathForSelectedRow?.row
            workoutView.workoutData = allWorkouts[currentSelectedIndex!]
            
            }
        
    }
}
