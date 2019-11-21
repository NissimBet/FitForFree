//
//  calendarViewController.swift
//  FitForFree
//
//  Created by Ricardo on 11/20/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class calendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
    }
    
    //2
    func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
      return 35
    }
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

          return CGSize(width: collectionView.bounds.size.width/8, height: collectionView.bounds.size.height/5)
    }
    
    func collectionView(
      _ collectionView: UICollectionView,
      cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! dateCellCollectionViewCell
        if (indexPath.row < 3) {
            cell.dateText.text = ""
        } else {
            cell.dateText.text = "\(indexPath.row - 2)"
            cell.backgroundColor = UIColor.cyan
        }
    
        
      // Configure the cell
      return cell
    }
    
    @IBOutlet weak var lblCalories: UILabel!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let calories = Int.random(in: 50 ..< 300)
        lblCalories.text = "El día \(indexPath.row - 2) de Noviembre quemaste \(calories) calorías"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
