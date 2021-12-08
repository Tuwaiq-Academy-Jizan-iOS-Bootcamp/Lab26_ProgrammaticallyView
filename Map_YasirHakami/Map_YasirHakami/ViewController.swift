//
//  ViewController.swift
//  Map_YasirHakami
//
//  Created by Yasir Hakami on 07/12/2021.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    var mapviwe:MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        mapviwe = MKMapView()
        view = mapviwe
        
        let segmentedControll = UISegmentedControl(items: ["Standard","Highbred","Satalite"])
        view.addSubview(segmentedControll)
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        segmentedControll.selectedSegmentIndex = 0
        segmentedControll.backgroundColor = UIColor.systemBackground
        let topConstraint = segmentedControll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let ledingConstraint = segmentedControll.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let triliingConstraint = segmentedControll.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        segmentedControll.addTarget(self, action: #selector(mapType(_:)), for: .valueChanged)
        topConstraint.isActive = true
        ledingConstraint.isActive = true
        triliingConstraint.isActive = true
        // label
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelTop = label.topAnchor.constraint(equalTo: segmentedControll.bottomAnchor, constant: 10)
        let labelLeading = label.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        labelLeading.isActive = true
        labelTop.isActive = true
        label.text = "Point of interest"
            
        // switch butten
        let switchButten = UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        view.addSubview(switchButten)
        switchButten.translatesAutoresizingMaskIntoConstraints = false
        let switchButtenTop = switchButten.topAnchor.constraint(equalTo: segmentedControll.bottomAnchor, constant: 5)
        let switchButtenLeading = switchButten.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 10)
        switchButten.isOn = true
        switchButtenLeading.isActive = true
        switchButtenTop.isActive = true
        
        switchButten.addTarget(self, action: #selector(PointsOfIntrest(_:)), for: .valueChanged)
    }
    
    @objc func mapType(_ segmented:UISegmentedControl){
        
        switch segmented.selectedSegmentIndex {
        case 0:
            mapviwe.mapType = .standard
        case 1:
            mapviwe.mapType = .hybrid
        case 2:
            mapviwe.mapType = .satellite
        default: print("Error")
        }
    }
    @objc func PointsOfIntrest(_ UIswitch:UISwitch){
        
        switch UIswitch.isOn {
        case true:
            mapviwe.pointOfInterestFilter = .includingAll
        case false:
            mapviwe.pointOfInterestFilter = .excludingAll
        }
    }

}

