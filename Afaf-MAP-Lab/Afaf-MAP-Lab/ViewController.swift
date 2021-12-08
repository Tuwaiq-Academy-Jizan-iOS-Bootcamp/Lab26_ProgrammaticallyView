//
//  ViewController.swift
//  Afaf-MAP-Lab
//
//  Created by Afaf Yahya on 03/05/1443 AH.
//

import UIKit
import MapKit
class ViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func viewDidLoad() { super.viewDidLoad()}
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
//        defin segmented Control
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satalite"])
            segmentedControl.backgroundColor = UIColor.systemBackground
            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
            segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        
        let topcontraint =
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8 )
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trallingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topcontraint.isActive = true
        leadingConstraint.isActive = true
        trallingConstraint.isActive = true
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)

        
// defin swich
        let swich = UISwitch()
        swich.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(swich)
         let topConstraintSwitch = swich.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50)
         let leadingConstraintSwitch = swich.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 145)
         let traillingConstraintSwitch =  swich.trailingAnchor.constraint(equalTo: margins.trailingAnchor )
        
         topConstraintSwitch.isActive = true
         leadingConstraintSwitch.isActive = true
         traillingConstraintSwitch.isActive = true
        swich.addTarget(self, action: #selector(interst(_:)), for: .valueChanged)

//        defin lable
        let lable = UILabel()
       
        lable.text = " Points of interst"
        lable.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(lable)
        
               
               let topConstraintLabel = lable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50)
        let leadingConstraintLabel = lable.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 3)
               let traillingConstraintLabel = lable.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
               
               topConstraintLabel.isActive = true
               leadingConstraintLabel.isActive = true
               traillingConstraintLabel.isActive = true
        

    }
// chang segmented Control
   @objc func mapTypeChanged(_ segControl: UISegmentedControl){
            switch segControl.selectedSegmentIndex {
            case 0 :
                mapView.mapType = .standard
            case 1 :
                mapView.mapType = .hybrid
            case 2 :
                mapView.mapType = .standard
            default :
                print("No")
            }
        }

//    chang switch

    @objc func interst(_ sendr:UISwitch ) {
            if sendr.isOn {
                mapView.pointOfInterestFilter = .includingAll
            }else{
                mapView.pointOfInterestFilter = .excludingAll
            }
        }
    
}
