//
//  ViewController.swift
//  FitForFree
//
//  Created by Ricardo on 10/12/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var exerciseTable: UITableView!
    @IBOutlet weak var dietTable: UITableView!
    
    var dataExercises: NSDictionary!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        exerciseTable.delegate = self
        exerciseTable.dataSource = self
        dietTable.delegate = self
        dietTable.dataSource = self
        
        let path = Bundle.main.path(forResource: "Exercises", ofType: "plist")
        dataExercises = NSDictionary(contentsOfFile: path!)
}
    
    // MARK: - TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(tableView)
        if tableView == exerciseTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath)
            let workouts: NSArray = dataExercises.object(forKey: "Workouts") as! NSArray
            let workout: NSObject = workouts[indexPath.row] as! NSObject
            let workoutName = workout.value(forKey: "Name") as! String
            cell.textLabel?.text = workoutName
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dietCell", for: indexPath)
            cell.textLabel?.text = ""
            return cell
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "exerciseSegue" {
            let destination = segue.destination as! exerciseViewController
            let indexPath = exerciseTable.indexPathForSelectedRow!
            let workouts: NSArray = dataExercises.object(forKey: "Workouts") as! NSArray
            let workout: NSObject = workouts[indexPath.row] as! NSObject
            destination.workoutInfo = workout
        }
    }


}

