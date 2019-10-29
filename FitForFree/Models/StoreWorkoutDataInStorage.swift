//
//  StoreWorkoutDataInStorage.swift
//  FitForFree
//
//  Created by Alumno on 10/29/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class StoreWorkoutDataInStorage: NSObject, Codable {
    static func getStorageURL() -> URL {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return url
        }
        else {
            fatalError("Could not find url for directory")
        }
    }
}
