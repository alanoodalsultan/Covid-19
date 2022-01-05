//
//  LocationOfHospitals.swift
//  Covid-19-
//
//  Created by alanood on 08/12/2021.
//

import UIKit
import CoreLocation
import MapKit

class LocationOfHospitals: UIViewController ,CLLocationManagerDelegate, MKMapViewDelegate {
    /// to make maker in map
    let annotationOne = MKPointAnnotation() // -> For Locations one
    let annotationTow = MKPointAnnotation() // -> for Location tow

    let annotation3 = MKPointAnnotation()
//    let annotationTow = MKPointAnnotation()
//    let annotationTow = MKPointAnnotation()
   
    /// to set distance up form location in Meters
    let distanceInMeters: Double = 2000
    
    var locationManger: CLLocationManager!
    lazy var mapview : MKMapView = {
        let mv = MKMapView()
        mv.translatesAutoresizingMaskIntoConstraints = false
        mv.delegate = self
        return mv
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        //region
        // the to show
        view.backgroundColor = .white
        let location = CLLocationCoordinate2D(latitude:18.2173202, longitude: 42.5130449)
        
        let region = MKCoordinateRegion(center: location, latitudinalMeters: distanceInMeters, longitudinalMeters: distanceInMeters)
        mapview.setRegion(region, animated: true)
        // maker
        annotationOne.coordinate = CLLocationCoordinate2D(latitude: 18.2273419 , longitude: 42.5101292)
        annotationTow.coordinate = CLLocationCoordinate2D(latitude: 18.2075827 , longitude: 42.5639199)
        annotation3.coordinate = CLLocationCoordinate2D(latitude: 18.2075827 , longitude: 42.5639199)
        annotationTow.title = "hospital".localized
        annotationOne.title = "hospital".localized
        mapview.addAnnotation(annotationOne)
        mapview.addAnnotation(annotationTow)
        mapview.addAnnotation(annotation3)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCancel))
        view.backgroundColor = .systemMint
        view.addSubview(mapview)
        NSLayoutConstraint.activate([
            mapview.topAnchor.constraint(equalTo: view.topAnchor),
            mapview.leftAnchor.constraint(equalTo: view.leftAnchor),
            mapview.rightAnchor.constraint(equalTo: view.rightAnchor),
            mapview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        if  (CLLocationManager.locationServicesEnabled())
        {
            locationManger = CLLocationManager()
            locationManger.delegate = self
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.requestAlwaysAuthorization()
            locationManger.startUpdatingHeading()
           
        }
    }
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let lat = location.coordinate.latitude
        let long = location.coordinate.longitude
        let loc = MKPointAnnotation()
        loc.title = "Abha"
        loc.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        mapview.addAnnotation(loc)
    }
}

