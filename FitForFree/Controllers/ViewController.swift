//
//  ViewController.swift
//  FitForFree
//
//  Created by Ricardo on 10/12/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var dietTable: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var mainImage: UIImageView!
        
    var workouts: [WorkoutData]! = [WorkoutData]()
    var planesDieta: [PlanAlimenticio]! = [PlanAlimenticio]()
    var locationData : [Location]! = [Location]()
    let imageUrl2 = URL(string: "https://media0.giphy.com/media/iQK5zCZL4mBuU/giphy.gif?cid=790b761105ae5cfbe8e70adcd2dd63c002726c3fbffe119a&rid=giphy.gif")!
    
    let dbRef = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dietTable.delegate = self
        dietTable.dataSource = self
        
        title = "Fit For Free"
        
        setImageSettings()
        loadFirebaseWorkouts()
        loadFirebaseMeals()
        loadFirebaseLocation()
}
    
    func loadFirebaseWorkouts() {
        let _ = dbRef.child("workouts").observe(.value, with: { (snapshot) in
            for workout in (snapshot.value as! [NSDictionary]) {
                let name = workout.value(forKey: "name") as! String
                let description = workout.value(forKey: "description") as! String
                let excercises = workout.value(forKey: "exercises") as! [NSDictionary]
                
                var workEx = [ExcerciseData]()
                
                for anyEx in excercises {
                    let exName = anyEx.value(forKey: "name") as! String
                    let exDesc = anyEx.value(forKey: "description") as! String
                    let exUrl = anyEx.value(forKey: "videoURL") as! String
                    
                    workEx.append(ExcerciseData(name: exName, description: exDesc, videoURL: exUrl))
                }
                
                self.workouts.append(WorkoutData(name: name, description: description, excerciseList: workEx))
            }
        })
    }
    
    func loadFirebaseMeals() {
        let _ = dbRef.child("planes").observe(.value, with: { (snapshot) in
            for mealPlan in (snapshot.value as! [NSDictionary]) {
                let name = mealPlan.value(forKey: "name") as! String
                let desc = mealPlan.value(forKey: "description") as! String
                let tipo = mealPlan.value(forKey: "tipoCuerpo") as! String
                let desayuno = mealPlan.value(forKey: "desayuno") as! [String]
                let almuerzo = mealPlan.value(forKey: "almuerzo") as! [String]
                let cena = mealPlan.value(forKey: "cena") as! [String]
                
                self.planesDieta.append(PlanAlimenticio(name: name, tipo: tipo, description: desc, desayuno: desayuno, almuerzo: almuerzo, cena: cena))
            }
            self.dietTable.reloadData()
        })
    }
    
    func loadFirebaseLocation() {
        let _ = dbRef.child("localizacion").observe(.value, with: { (snapshot) in
            for location in (snapshot.value as! [NSDictionary]) {
                let horario = location.value(forKey: "horario") as! String
                let latitud = location.value(forKey: "latitud") as! Double
                let longitud = location.value(forKey: "longitud") as! Double
                let nombre = location.value(forKey: "nombre") as! String
                let contacto = location.value(forKey: "contacto") as! String
                
                self.locationData.append(Location(latitud: latitud, longitud: longitud, contacto: contacto, horario: horario, name: nombre))
            }
        })
    }
    
    func setImageSettings() {
        mainImage.image = Utils.getImage(name: "FitForFree")
        spinner.isHidden = true
        //downloadImage(with: imageUrl2)
        //mainImage.image = Utils.getImage(name: "workout1")
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
        else if segue.identifier == "segueToLocation" {
            let locationVista = segue.destination as! LocalizationViewController
            
            locationVista.locationData = locationData
            
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
                self.mainImage.image = UIImage.gif(data: data!)
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
