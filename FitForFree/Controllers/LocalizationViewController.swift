//
//  LocalizationViewController.swift
//  FitForFree
//
//  Created by Alumno on 10/31/19.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit
import MapKit

class LocalizationViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapLocation: MKMapView!
    @IBOutlet weak var lbContacto: UILabel!
    @IBOutlet weak var lbHorario: UILabel!
    
    var locationData : Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbContacto.text = locationData.contacto
        lbHorario.text = locationData.horario
        
        setupMap()
    }
    
    func setupMap() {
        mapLocation.delegate = self
        
        // TODO: - Arreglar mapa
        
        let _ = MKCoordinateSpan(latitudeDelta: CLLocationDegrees(exactly: 0.1)!, longitudeDelta: CLLocationDegrees(exactly: 0.1)!)
        
        let centerX = locationData.pins.reduce(0.0, { (accum: Double, data: MKMapPoint) in accum + data.x }) / Double(locationData.pins.count)
        let centerY = locationData.pins.reduce(0.0, { (accum: Double, data: MKMapPoint) in accum + data.y }) / Double(locationData.pins.count)
        
        let center = MKMapPoint(x: centerX, y: centerY)
        
        mapLocation.setRegion(MKCoordinateRegion(MKMapRect(origin: center, size: MKMapSize(width: 0.5, height: 0.5))), animated: true)
        
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
