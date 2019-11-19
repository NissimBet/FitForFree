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
    
    var locationData : [Location]! = [Location]()
    
    // MARK: - ARREGLAR EL LOCATION CONTROLLER, CAMBIO DEL MODEL DE LOCATION
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //lbContacto.text = locationData.contacto
        //lbHorario.text = locationData.horario
        
        setupMap()
    }
    
    func setupMap() {
        
        mapLocation.isZoomEnabled = true
        
        var annotations = [MKAnnotation]()
        for pin in locationData {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: pin.latitud, longitude: pin.longitud)
            annotation.title = pin.name
            annotation.subtitle = pin.horario
            annotations.append(annotation)
       }

        
        let centerX = locationData.reduce(0.0, { (accum: Double, data: Location) in accum + data.latitud }) / Double(locationData.count)
        let centerY = locationData.reduce(0.0, { (accum: Double, data: Location) in accum + data.longitud }) / Double(locationData.count)
    
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let center = CLLocationCoordinate2D(latitude: centerX, longitude: centerY)
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapLocation.setRegion(region, animated: true)
        mapLocation.addAnnotations(annotations)
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
