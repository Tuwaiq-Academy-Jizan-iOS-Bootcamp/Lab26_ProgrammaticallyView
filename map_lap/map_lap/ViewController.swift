//
//  ViewController.swift
//  map_lap
//
//  Created by dahma alwani on 04/05/1443 AH.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    var mapView: MKMapView!
    
 
    override func viewDidLoad() {super.viewDidLoad()}
    override func loadView() {
        mapView = MKMapView()
        view = mapView

let segmentedControl = UISegmentedControl(items: ["Standerd", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentIndex = 0
    view.addSubview(segmentedControl)
    
    let topConsttrain = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8 )
    let margins = view.layoutMarginsGuide
        let leadingConstrain = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let traillingConstrain = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConsttrain.isActive = true
        leadingConstrain.isActive = true
        traillingConstrain.isActive = true
        segmentedControl.addTarget(self, action: #selector(mapTypeChange(_:)), for: .valueChanged)
        
        let theSwitch = UISwitch()
        theSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(theSwitch)
        let topConstraintSwitch = theSwitch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50)
        let leadingConstraintSwitch = theSwitch.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 145)
        let traillingConstraintSwitch =  theSwitch.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
                
        topConstraintSwitch.isActive = true
        leadingConstraintSwitch.isActive = true
        traillingConstraintSwitch.isActive = true
        let aLabel = UILabel()
        aLabel.text = "Points of interst"
        
       
        
              
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
              
        let topConstraintLabel = aLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50)
        let leadingConstraintLabel = aLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 3)
        let traillingConstraintLabel = aLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
              
        topConstraintLabel.isActive = true
        leadingConstraintLabel.isActive = true
        traillingConstraintLabel.isActive = true
        
        
        theSwitch.addTarget(self, action: #selector(interst(_:)), for: .valueChanged)
        
    }
    @objc func interst(_ sendr:UISwitch ) {
        if sendr.isOn {
            mapView.pointOfInterestFilter = .includingAll
        }else{
            mapView.pointOfInterestFilter = .excludingAll
        }
    }
    
    @objc func mapTypeChange(_ segControl: UISegmentedControl){
            switch segControl.selectedSegmentIndex{
            case 0 :
                mapView.mapType = .standard
              
            case 1 :
                mapView.mapType = .hybrid
            case 2 :
                mapView.mapType = .satellite
            default:
                print("error")
            }
        }
   
}


