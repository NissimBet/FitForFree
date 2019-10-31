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
    var pins : [MKMapPoint]!
    var contacto : String!
    var horario : String!
    
    init(pins : [MKMapPoint], contacto : String, horario : String) {
        self.pins = pins
        self.contacto = contacto
        self.horario = horario
    }
}
