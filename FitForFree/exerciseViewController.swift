//
//  exerciseViewController.swift
//  FitForFree
//
//  Created by Ricardo on 10/12/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class exerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var lblRoutineName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var excercisesTable: UITableView!
    
    var workoutInfo: NSObject!
    var excercises: [ExcerciseData] = [ExcerciseData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblRoutineName.text = (workoutInfo.value(forKey: "Name") as! String)
        lblDescription.text = (workoutInfo.value(forKey: "Description") as! String)
        
        let workoutArray: [String] = (workoutInfo.value(forKey: "WarmUp") as! NSArray).compactMap({ $0 as? String })

    }
    

    // MARK: - Table View functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutDataExcerciseCell", for: indexPath)
        cell.textLabel!.text = "a"
        
        return cell
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
