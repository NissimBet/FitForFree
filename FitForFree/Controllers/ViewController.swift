//
//  ViewController.swift
//  FitForFree
//
//  Created by Ricardo on 10/12/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var dietTable: UITableView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    var allData: NSDictionary!
    
    var workouts: [WorkoutData]! = [WorkoutData]()
    var planesDieta: [PlanAlimenticio]! = [PlanAlimenticio]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dietTable.delegate = self
        dietTable.dataSource = self
        
        title = "Fit For Free"
        
        loadData()
        setImageSettings()
        
}
    
    func loadData() {
        let path = Bundle.main.path(forResource: "Exercises", ofType: "plist")
        allData = NSDictionary(contentsOfFile: path!)
        
        let allWorkouts = allData.object(forKey: "Workouts") as? [NSDictionary]
        
        for work in allWorkouts! {
            let excercises = work.value(forKey: "excerciseList") as! [NSDictionary]
            var newExcercises = [ExcerciseData]()
            
            let tempWorkout = WorkoutData(name: "", description: "", excerciseList: [ExcerciseData]())
            
            tempWorkout.name = (work.value(forKey: "name") as! String)
            tempWorkout.workoutDescription = (work.value(forKey: "workoutDescription") as! String)
            
            for exc in excercises {
                let tempExcercise = ExcerciseData(name: "", description: "")
                
                tempExcercise.name = (exc.value(forKey: "name") as! String)
                tempExcercise.excerciseDescription = (exc.value(forKey: "excerciseDescription") as! String)
                
                newExcercises.append(tempExcercise)
                
            }
            tempWorkout.excerciseList = newExcercises
            workouts.append(tempWorkout)
        }
        
        let allPlans = allData.object(forKey: "Plans") as? [NSDictionary]
        
        for plan in allPlans! {
            let tempPlan = PlanAlimenticio(name: "", tipo: "", description: "", desayuno: [String](), almuerzo: [String](), cena: [String]())
            
            tempPlan.name = (plan.value(forKey: "name") as! String)
            tempPlan.planDescription = (plan.value(forKey: "planDescription") as! String)
            tempPlan.tipoCuerpo = (plan.value(forKey: "tipoCuerpo") as! String)
            
            tempPlan.desayuno = (plan.value(forKey: "desayuno") as! [String])
            tempPlan.almuerzo = (plan.value(forKey: "almuerzo") as! [String])
            tempPlan.cena = (plan.value(forKey: "cena") as! [String])
            
            planesDieta.append(tempPlan)
        }
        
    }
    
    func setImageSettings() {
        mainImage.image = Utils.getImage(name: "mainPageImage")
        mainImage.contentMode = .scaleAspectFit
    }
    
    // MARK: - TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == dietTable {
            return planesDieta.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == dietTable {
            let index = indexPath.row
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "dietCell", for: indexPath)
            cell.textLabel?.text = planesDieta[index].name
            return cell
        }
        return UITableViewCell()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "exerciseSegue" {
            
        }
        else if segue.identifier == "workoutSegue" {
            let workoutsView = segue.destination as! AllWorkoutsTableViewController
            
            workoutsView.allWorkouts = workouts
        }
        else if segue.identifier == "segueToPlanesAlimenticios" {
            let planVista = segue.destination as! PlanAlimenticioViewController
            
            let index = dietTable.indexPathForSelectedRow?.row
            
            planVista.planData = planesDieta[index!]
        }
    }


}
