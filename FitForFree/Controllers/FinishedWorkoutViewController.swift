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
    var imgURL = URL(string: "https://media0.giphy.com/media/xT8qBepJQzUjXpeWU8/giphy.gif?cid=790b7611d6ae704a0c1047864e4f5543cb4ff4d56f635984&rid=giphy.gif")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imgChart.image = Utils.getImage()
        downloadImage(with: imgURL!)
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
    
    func downloadImage(with url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.imgChart.image = UIImage.gif(data: data!)
            }
        }.resume()
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
