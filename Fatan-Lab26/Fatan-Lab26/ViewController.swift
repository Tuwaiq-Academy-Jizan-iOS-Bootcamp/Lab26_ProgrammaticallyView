//
//  ViewController.swift
//  Fatan-Lab26
//
//  Created by Faten Abdullh salem on 04/05/1443 AH.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        
    }
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        let labelView = UILabel()
        let switchView = UISwitch()
        
        
        labelView.text = "Points of interset"
let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid", "Satellite"])
        
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
    segmentedControl.selectedSegmentIndex = 0
    view.addSubview(segmentedControl)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        switchView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelView)
        view.addSubview(switchView)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let topConstraint1 = labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55)
        let topConstraint2 = switchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        
let margins = view.layoutMarginsGuide
let leadingConstant = segmentedControl.trailingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 300)
        let leadingConstant1 = labelView.trailingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 120)
        let leadingConstant2 = switchView.trailingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 180)
     
let trailingConstant = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        let trailingConstant1 = labelView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        let trailingConstant2 = switchView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstant.isActive = true
        trailingConstant.isActive = true
        
        topConstraint1.isActive = true
        leadingConstant1.isActive = true
        trailingConstant1.isActive = true
        
        topConstraint2.isActive = true
        leadingConstant2.isActive = true
        trailingConstant2.isActive = true
        
segmentedControl.addTarget(self, action: #selector(mapTypeChange(_:)), for: .valueChanged)
        switchView.addTarget(self, action: #selector(myTypeChange(_:)), for: .valueChanged)

    }
    @objc func mapTypeChange(_ segControl:UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            print("Error")
        }
}
    @objc func myTypeChange(_ change: UISwitch){
        if change.isOn{
            mapView.pointOfInterestFilter = .excludingAll
        }else{
            mapView.pointOfInterestFilter = .includingAll
        }
    }

}
