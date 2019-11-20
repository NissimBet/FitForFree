//
//  ExcerciseViewController.swift
//  FitForFree
//
//  Created by Alumno on 10/25/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class ExcerciseViewController: UIViewController {

    @IBOutlet weak var lbExcName: UILabel!
    @IBOutlet weak var imgExc: UIImageView!
    @IBOutlet weak var lbExcDescription: UILabel!
    
    var excerciseData : ExcerciseData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = excerciseData.name
        lbExcName.text = excerciseData.name
        lbExcDescription.text = excerciseData.excerciseDescription
        let Gif = URL(string: excerciseData.videoURL)
        downloadImage(with: Gif!)
    }
    
    
    func downloadImage(with url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.imgExc.image = UIImage.gif(data: data!)
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
