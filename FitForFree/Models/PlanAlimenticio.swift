//
//  PlanAlimenticio.swift
//  FitForFree
//
//  Created by Alumno on 10/31/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class PlanAlimenticio: NSObject {
    var name: String!
    var planDescription: String!
    var tipoCuerpo: String!
    var alimentos: [String]!
    
    init(name: String, tipo: String, description: String, alimentos: [String] ) {
        self.name = name
        self.tipoCuerpo = tipo
        self.planDescription = description
        self.alimentos = alimentos
    }
    
}
