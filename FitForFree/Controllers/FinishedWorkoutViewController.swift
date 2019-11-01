//
//  FinishedWorkoutViewController.swift
//  FitForFree
//
//  Created by Alumno on 10/29/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class FinishedWorkoutViewController: UIViewController {

    @IBOutlet weak var imgChart: UIImageView!
    @IBOutlet weak var lbCongratx: UILabel!
    
    var calories : Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgChart.image = Utils.getImage()
        lbCongratx.text = "Felicidades!! Hoy quemaste \(calories!)!!"
        
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func doSegueToWorkoutHistory() {
        performSegue(withIdentifier: "segueToWorkoutHistory", sender: self)
    }
    
    @IBAction func doDone(_ sender: Any) {
        doSegueToWorkoutHistory()
    }
    
    @IBAction func doFinish(_ sender: Any) {
        doSegueToWorkoutHistory()
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
