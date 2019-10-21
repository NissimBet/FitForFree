//
//  ExcerciseData.swift
//  FitForFree
//
//  Created by Alumno on 10/21/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class ExcerciseData: NSObject {
    var name: String!
    var excerciseDescription: String!
    var videoURL: String!
    
    init(name: String, description: String, videoURL: String = "") {
        self.name = name
        self.excerciseDescription = description
        self.videoURL = videoURL
    }
}
