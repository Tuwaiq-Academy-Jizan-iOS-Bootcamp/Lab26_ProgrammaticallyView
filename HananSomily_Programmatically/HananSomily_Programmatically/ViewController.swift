//
//  ViewController.swift
//  HananSomily_Programmatically
//
//  Created by Hanan Somily on 07/12/2021.
//

import UIKit
import MapKit
class ViewController: UIViewController {
    var mapView : MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
       mapView = MKMapView()
        view = mapView
        let segmantedControl = UISegmentedControl(items: ["Standard","Hyprid","Satellite"])
        segmantedControl.backgroundColor = UIColor.systemBackground
        segmantedControl.translatesAutoresizingMaskIntoConstraints = false
        segmantedControl.selectedSegmentIndex = 0
        let margin = view.layoutMarginsGuide
        view.addSubview(segmantedControl)
        let tapConstraint = segmantedControl.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 10)
        let leadingConstraint = segmantedControl.leadingAnchor.constraint(equalTo: margin.leadingAnchor)
        let trailingConstraint = segmantedControl.trailingAnchor.constraint(equalTo: margin.trailingAnchor)
        tapConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        //tapConstraintSWitch.isActive = true
        segmantedControl.addTarget(self, action: #selector(selectSegment(_:)), for: .valueChanged)

/////
        let Label = UILabel()
        Label.text = "Points of Interest"
        view.addSubview(Label)
        Label.translatesAutoresizingMaskIntoConstraints = false
       // Label.backgroundColor = .white
        let labelTopConstrant = Label.topAnchor.constraint(equalTo:segmantedControl.lastBaselineAnchor , constant: 26)
        let lableLeadingConstrant = Label.leadingAnchor.constraint(equalTo: margin.leadingAnchor , constant: 0)
//        contourLabel.leadingAnchor.constraint(equalTo: switchViewTitle.trailingAnchor, constant: margin.trailingAnchor)
        labelTopConstrant.isActive = true
        lableLeadingConstrant.isActive = true
    var switchViewTitle = UISwitch()
        view.addSubview(switchViewTitle)
        switchViewTitle.translatesAutoresizingMaskIntoConstraints = false
let tapConstraintSWitch = switchViewTitle.topAnchor.constraint(equalTo:segmantedControl.lastBaselineAnchor , constant: 20)
let leadingConstraintSWitch = switchViewTitle.leadingAnchor.constraint(equalTo: Label.trailingAnchor,constant: 0)
        tapConstraintSWitch.isActive = true
        leadingConstraintSWitch.isActive = true
        switchViewTitle.addTarget(self, action: #selector(switchTitle(_:)), for: .valueChanged)
    
    }
    @objc func selectSegment(_ segment:UISegmentedControl){
        switch segment.selectedSegmentIndex{
        case 0 :
            mapView.mapType = .standard
        case 1 :
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            print("error")
        }
    }
    @objc func switchTitle(_ switches:UISwitch){
        if switches.isOn {
            mapView.pointOfInterestFilter = .excludingAll
        }else{
            mapView.pointOfInterestFilter = .includingAll
        }
    }
}

