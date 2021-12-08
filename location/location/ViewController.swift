//
//  ViewController.swift
//  location
//
//  Created by grand ahmad on 03/05/1443 AH.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    let locationManager =  CLLocationManager()
    var mapView:MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addAnnotation()
    }
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        let labelView = UILabel()
        let switchView = UISwitch()
        
        switchView.isOn = true
        labelView.text = "Points of Interset"
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        

        labelView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint1 = labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55)
        view.addSubview(labelView)
        
        switchView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint2 = switchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        view.addSubview(switchView)
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint1 = labelView.leadingAnchor.constraint(equalTo:margins.leadingAnchor)
        let trallingConstraint1 = labelView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo:margins.leadingAnchor)
        let trallingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        let leadingConstraint2 = switchView.leadingAnchor.constraint(equalTo:margins.leadingAnchor, constant: 150)
        let trallingConstraint2 = switchView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trallingConstraint.isActive = true
        
        topConstraint1.isActive = true
        leadingConstraint1.isActive = true
        trallingConstraint1.isActive = true
        
        topConstraint2.isActive = true
        leadingConstraint2.isActive = true
        trallingConstraint2.isActive = true
        segmentedControl.addTarget(self, action: #selector(mapMyTypeView(_:)), for: .valueChanged)
        switchView.addTarget(self, action: #selector(switchMyTypeChange(_:)), for: .valueChanged)
    }
    
    @objc func mapMyTypeView(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0 :
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            print("ERROR")
            
        }
    }
        @objc func switchMyTypeChange(_ switchChange: UISwitch){
            if switchChange.isOn {
                mapView.pointOfInterestFilter = .excludingAll
            }else{
                mapView.pointOfInterestFilter = .includingAll
            }
        }

    func addAnnotation(){
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 24.693719, longitude: 64.723596)
        pin.title = "MY TITLE"
        pin.subtitle = "MY PIN SUBTITLE"
        mapView.addAnnotation(pin)


    }
}

