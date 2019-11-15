//
//  Location.swift
//  FitForFree
//
//  Created by Alumno on 10/31/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit

class Location: NSObject {
    var latitud: Float!
    var longitud: Float!
    var contacto : String!
    var horario : String!
    var name: String!
    
    init(latitud: Float, longitud: Float, contacto : String, horario : String, name: String) {
        self.latitud = latitud
        self.longitud = longitud
        self.contacto = contacto
        self.horario = horario
        self.name = name
    }
}
