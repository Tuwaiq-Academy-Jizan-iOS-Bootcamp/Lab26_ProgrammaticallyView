//
//  ViewController.swift
//  prog map
//
//  Created by موسى مسملي on 07/12/2021.
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
        //
        let margins = view.layoutMarginsGuide
        let segmentedControl = UISegmentedControl(items: ["Standard","Highbred","Satalite"])
        let labelOfPoints = UILabel()
        let pointOfIntrestSwitch = UISwitch()
        //
        labelOfPoints.text = "Point Of Interests"
        labelOfPoints.translatesAutoresizingMaskIntoConstraints = false
        //
        pointOfIntrestSwitch.translatesAutoresizingMaskIntoConstraints = false
        pointOfIntrestSwitch.isOn = true
        pointOfIntrestSwitch.setOn(true, animated: false)
        //
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        //
        view.addSubview(segmentedControl)
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo:margins.trailingAnchor).isActive = true
        //
        view.addSubview(labelOfPoints)
        labelOfPoints.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
        labelOfPoints.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        //
        view.addSubview(pointOfIntrestSwitch)
        pointOfIntrestSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5).isActive = true
        pointOfIntrestSwitch.leftAnchor.constraint(equalTo: labelOfPoints.rightAnchor, constant: 10).isActive = true
        //
        segmentedControl.addTarget(self, action: #selector(changeTheMapType(_:)), for: .valueChanged)
        pointOfIntrestSwitch.addTarget(self, action: #selector(showPointsOfIntrest(_:)), for: .valueChanged)
    }
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
