//
//  Location.swift
//  FitForFree
//
//  Created by Alumno on 10/31/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit
import MapKit

class Location: NSObject {
    var latitud: CLLocationDegrees!
    var longitud: CLLocationDegrees!
    var contacto : String!
    var horario : String!
    var name: String!
    
    init(latitud: Double, longitud: Double, contacto : String, horario : String, name: String) {
        self.latitud = CLLocationDegrees(exactly: latitud)!
        self.longitud = CLLocationDegrees(exactly: longitud)!
        self.contacto = contacto
        self.horario = horario
        self.name = name
    }
}
