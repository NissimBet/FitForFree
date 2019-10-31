//
//  Utils.swift
//  FitForFree
//
//  Created by Alumno on 10/31/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class Utils: NSObject {
    static func getImage(name: String = "noImage") -> UIImage {
        if let newImage = UIImage(named: name) {
            return newImage
        }
        
        return UIImage(named: "noImage")!
    }
}
