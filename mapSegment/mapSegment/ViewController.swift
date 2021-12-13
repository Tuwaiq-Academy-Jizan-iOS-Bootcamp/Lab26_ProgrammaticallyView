//
//  ViewController.swift
//  mapSegment
//
//  Created by Abdulrhman Abuhyyh on 03/05/1443 AH.
//

import UIKit
import MapKit
class ViewController: UIViewController {
    var mapView : MKMapView!
//    var switchView : UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func loadView() {
        mapView = MKMapView()
        view = mapView
       
        let seqmentedControl = UISegmentedControl(items: ["Standard","Hyperd","Satlaite"])
        seqmentedControl.translatesAutoresizingMaskIntoConstraints = false
        seqmentedControl.selectedSegmentIndex = 0
        seqmentedControl.backgroundColor = UIColor.systemBackground
        view.addSubview(seqmentedControl)
        let topConstrint = seqmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = seqmentedControl.leadingAnchor.constraint(equalTo:margins.leadingAnchor)
        let trailingConstraint = seqmentedControl.trailingAnchor.constraint(equalTo:margins.trailingAnchor)
        
        let labelOfPoints = UILabel()
        let switchOffAndOne = UISwitch()
        labelOfPoints.text = "Point Of Interests"
             labelOfPoints.translatesAutoresizingMaskIntoConstraints = false
             // Switch Settings
        switchOffAndOne.translatesAutoresizingMaskIntoConstraints = false
        switchOffAndOne.isOn = true
        switchOffAndOne.setOn(true, animated: false)
        //teh step for size the segmented button area
        topConstrint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
//        seqmentedControl.addTarget(self, action: #selector(mapTypeChange(_ segmetControl:)), for: .valueChanged)
        view.addSubview(labelOfPoints)
        view.addSubview(switchOffAndOne)
        labelOfPoints.topAnchor.constraint(equalTo: seqmentedControl.bottomAnchor, constant: 10).isActive = true
        labelOfPoints.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        switchOffAndOne.topAnchor.constraint(equalTo: seqmentedControl.bottomAnchor, constant: 5).isActive = true
        switchOffAndOne.leftAnchor.constraint(equalTo: labelOfPoints.rightAnchor, constant: 10).isActive = true
              // Objective C Functions..
        seqmentedControl.addTarget(self, action: #selector(mapTypeChange(_:)), for: .valueChanged)
        switchOffAndOne.addTarget(self, action: #selector(showPointsOfIntrest(_:)), for: .valueChanged)
      

    }
    @objc func mapTypeChange(_ segmetControl:UISegmentedControl){
        switch segmetControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            print("ERROR")
        }
    }
    @objc func showPointsOfIntrest(_ withUISwitch: UISwitch) {
            switch withUISwitch.isOn {
            case true: mapView.pointOfInterestFilter = .includingAll
            case false: mapView.pointOfInterestFilter = .excludingAll
            }
        }

}
