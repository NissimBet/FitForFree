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
    var desayuno: [String]!
    var almuerzo: [String]!
    var cena: [String]!
    
    init(name: String, tipo: String, description: String, desayuno: [String], almuerzo: [String], cena: [String] ) {
        self.name = name
        self.tipoCuerpo = tipo
        self.planDescription = description
        self.desayuno = desayuno
        self.almuerzo = almuerzo
        self.cena = cena
    }
    
}
