//
//  ViewController.swift
//  map
//
//  Created by NoON .. on 03/05/1443 AH.
//
import UIKit
import MapKit
class ViewController: UIViewController {
    
    var mapView:MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        mapView = MKMapView()
        view = mapView
  // create segmentedControl
        let segmentedControl = UISegmentedControl(items:["Standerd","Hybrid","satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        topConstraint.isActive = true
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 300)
       leadingConstraint.isActive = true
        let traillingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        traillingConstraint.isActive = true
        segmentedControl.addTarget(self, action: #selector(mapTypeChange(_:)), for: .valueChanged)
   // create switch
        let switchControl = UISwitch()
        view.addSubview(switchControl)
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint2 = switchControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        topConstraint2.isActive = true
        let leadingConstraint2 = switchControl.trailingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 180)
       leadingConstraint2.isActive = true
        let traillingConstraint2 = switchControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        traillingConstraint2.isActive = true
        switchControl.addTarget(self, action: #selector(myTypeChange(_:)), for: .valueChanged)
   // create lable
        let viewLabel = UILabel()
        view.addSubview(viewLabel)
        viewLabel.text = "Points of Interest"
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint3 = viewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 55)
        topConstraint3.isActive = true
        let leadingConstraint3 = viewLabel.trailingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 120)
       leadingConstraint3.isActive = true
        let traillingConstraint3 = viewLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        traillingConstraint3.isActive = true
    }
    // func segmentedControl
    @objc func mapTypeChange(_ segControl:UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0 :
            mapView.mapType = .standard
        case 1 :
            mapView.mapType = .hybrid
        case 2 :
            mapView.mapType = .satellite
        
        default:
            print("Error")
        }
    }
    // func Switch
    @objc func myTypeChange(_ change: UISwitch){
        if change.isOn{
            mapView.pointOfInterestFilter = .excludingAll
        }else{
            mapView.pointOfInterestFilter = .includingAll
        }
    }
}

