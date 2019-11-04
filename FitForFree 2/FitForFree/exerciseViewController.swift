//
//  exerciseViewController.swift
//  FitForFree
//
//  Created by Ricardo on 10/12/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class exerciseViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var lblRoutineName: UILabel!
    @IBOutlet weak var lblRoutineExercises: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var workoutInfo: NSObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblRoutineName.text = (workoutInfo.value(forKey: "Name") as! String)
        lblDescription.text = (workoutInfo.value(forKey: "Description") as! String)
        
        let workoutArray: [String] = (workoutInfo.value(forKey: "WarmUp") as! NSArray).compactMap({ $0 as? String })

        lblRoutineExercises.text = workoutArray.joined(separator: "\n")
        
        
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
