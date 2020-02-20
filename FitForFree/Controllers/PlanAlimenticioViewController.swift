//
//  PlanAlimenticioViewController.swift
//  FitForFree
//
//  Created by Alumno on 10/31/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PlanAlimenticioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var alimentos: UITableView!
    @IBOutlet weak var lbDescription: UILabel!
    
    var planData : PlanAlimenticio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alimentos.dataSource = self
        alimentos.delegate = self
        
        lbDescription.text = planData.planDescription
        
    }
    

    // MARK: - Table view functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == alimentos {
            switch section {
            case 0:
                return planData.desayuno.count
            case 1:
                return planData.almuerzo.count
            case 2:
                return planData.cena.count
            default:
                return 0
            }
        }
        
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == alimentos {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = alimentos.dequeueReusableCell(withIdentifier: "alimentoCell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            celda.textLabel?.text = planData.desayuno[indexPath.row]
        case 1:
            celda.textLabel?.text = planData.almuerzo[indexPath.row]
        case 2:
            celda.textLabel?.text = planData.cena[indexPath.row]
        default:
            celda.textLabel?.text = ""
        }
        
        return celda
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Desayuno"
        case 1:
            return "Almuerzo"
        case 2:
            return "Cena"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(30.0)
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
