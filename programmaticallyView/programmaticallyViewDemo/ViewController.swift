//
//  ViewController.swift
//  programmaticallyViewDemo
//
//  Created by Afrah Omar on 03/05/1443 AH.
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

//          segmentedControl
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let traillingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        traillingConstraint.isActive = true
        
// Label
        let aLabel = UILabel()
         aLabel.text = " Points of interst"
         aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        
        let topConstraintLabel = aLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50)
        let leadingConstraintLabel = aLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let traillingConstraintLabel = aLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraintLabel.isActive = true
        leadingConstraintLabel.isActive = true
        traillingConstraintLabel.isActive = true
        
// Switch
        
        let aSwitch = UISwitch()
        aSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aSwitch)
        let topConstraintSwitch = aSwitch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50)
        let leadingConstraintSwitch = aSwitch.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 145)
        let traillingConstraintSwitch =  aSwitch.trailingAnchor.constraint(equalTo: margins.trailingAnchor )
        
        topConstraintSwitch.isActive = true
        leadingConstraintSwitch.isActive = true
        traillingConstraintSwitch.isActive = true

//         function for Switch & Segmented
        
        aSwitch.addTarget(self, action: #selector(switchButton(_:)), for: .valueChanged)
        segmentedControl.addTarget(self , action: #selector(mapTypeChanged(_:)), for: .valueChanged)
    }
    @objc func switchButton(_ sender:UISwitch){
        if sender.isOn {
                mapView.pointOfInterestFilter = .includingAll
            }else{
                mapView.pointOfInterestFilter = .excludingAll
            }
        }
    @objc func mapTypeChanged(_ segControl : UISegmentedControl) {
            switch segControl.selectedSegmentIndex {
            case 0 : mapView.mapType = .standard
            case 1 : mapView.mapType = .hybrid
            case 2 : mapView.mapType = .satellite
            default :
                print("ERROR")
            }
    }
}
