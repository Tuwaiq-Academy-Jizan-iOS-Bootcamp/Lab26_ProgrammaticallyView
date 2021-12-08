//
//  ViewController.swift
//  maoKitProject
//
//  Created by ماك بوك on 03/05/1443 AH.
//

import UIKit
import MapKit
class ViewController: UIViewController {
    var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        let segmentedControl = UISegmentedControl(items: ["Standard","Highbred","Satalite"])
        
        
        let labelOfPoints = UILabel()
        let pointOfIntrestSwitch = UISwitch()
        
        
    
        
        // Switch and labelOfPoint Settings
        
        labelOfPoints.text = "Point Of Interests"
        labelOfPoints.translatesAutoresizingMaskIntoConstraints = false
      
        pointOfIntrestSwitch.translatesAutoresizingMaskIntoConstraints = false
        pointOfIntrestSwitch.isOn = true
        pointOfIntrestSwitch.setOn(true, animated: false)
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        let topLocation = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
      //+++++ Marging Layout++++// i may need it as let"" soon
        let margins = view.layoutMarginsGuide
        let leftLocation = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let rightLocation = segmentedControl.trailingAnchor.constraint(equalTo:margins.trailingAnchor)
        topLocation.isActive = true
        leftLocation.isActive = true
        rightLocation.isActive = true
        segmentedControl.addTarget(self, action: #selector(changeTheMapType(_:)), for: .valueChanged)
        
        
        view.addSubview(labelOfPoints)
        labelOfPoints.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
        labelOfPoints.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        // Point Of Intrest Switch Layout
        view.addSubview(pointOfIntrestSwitch)
        pointOfIntrestSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
        pointOfIntrestSwitch.leftAnchor.constraint(equalTo: labelOfPoints.rightAnchor, constant: 10).isActive = true
        // Objective C Functions..
        
        pointOfIntrestSwitch.addTarget(self, action: #selector(showPointsOfIntrest(_:)), for: .valueChanged)
   
        
    }
    // (places) in the map
    @objc func changeTheMapType(_ segmentControl: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .hybrid
        case 2: mapView.mapType = .satellite
        default: print("Error")
        }
    }
    @objc func showPointsOfIntrest(_ withUISwitch: UISwitch) {
        switch withUISwitch.isOn {
        case true: mapView.pointOfInterestFilter = .includingAll
        case false: mapView.pointOfInterestFilter = .excludingAll
        }
    }
}
