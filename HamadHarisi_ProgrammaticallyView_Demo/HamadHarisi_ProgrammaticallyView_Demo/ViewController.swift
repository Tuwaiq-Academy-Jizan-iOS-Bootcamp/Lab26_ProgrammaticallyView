//
//  ViewController.swift
//  HamadHarisi_ProgrammaticallyView_Demo
//
//  Created by حمد الحريصي on 07/12/2021.
//
import UIKit
import MapKit
class ViewController: UIViewController
{
    var mapView: MKMapView!
    
override func viewDidLoad()
{
}
override func loadView()
{
mapView = MKMapView()
view = mapView
    let margins = view.layoutMarginsGuide
    let segmentedControl = UISegmentedControl(items: ["Standard","Highbred","Satalite"])
    let labelOnMap = UILabel()
    let switchMap = UISwitch()
    
//    labelOnMap.attributedText = NSAttributedString.init(string: "Points of Interest")
    labelOnMap.text = "Points of Interest"
    labelOnMap.backgroundColor = .systemGroupedBackground
//    labelOnMap.textColor = .systemFill
    labelOnMap.textColor = .systemPurple
    labelOnMap.translatesAutoresizingMaskIntoConstraints = false
    
    
    segmentedControl.backgroundColor = UIColor.systemBackground
//    segmentedControl.tintColor = .systemGreen
    segmentedControl.selectedSegmentTintColor = .systemGreen
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentIndex = 0
    
    switchMap.translatesAutoresizingMaskIntoConstraints = false
    switchMap.onTintColor = .systemRed
    switchMap.isOn = true
    switchMap.setOn(true, animated: false)
    view.addSubview(switchMap)
    view.addSubview(segmentedControl)
    
    let topsegmented = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    let leftsegmented = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let rightsegmented = segmentedControl.trailingAnchor.constraint(equalTo:margins.trailingAnchor)
    topsegmented.isActive = true
    leftsegmented.isActive = true
    rightsegmented.isActive = true
    
    // label
    view.addSubview(labelOnMap)
  let topLabel =  labelOnMap.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 22)
  let leftLabel =  labelOnMap.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 22)
   topLabel.isActive = true
    leftLabel.isActive = true
    
   //switch
 let topSwitch =   switchMap.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 11)
  let leftSwitch =  switchMap.leftAnchor.constraint(equalTo: labelOnMap.rightAnchor, constant: 11)
    topSwitch.isActive = true
    leftSwitch.isActive = true
  
    switchMap.addTarget(self, action: #selector(mapSwitchPoint(_:)), for: .valueChanged)
    segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
    
    // switch

//    switchMap.translatesAutoresizingMaskIntoConstraints = false
//    view.addSubview(switchMap)
//    switchMap.isOn = true
//    switchMap.setOn(true, animated: false)
//    let topSwitch = switchMap.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 22)
//    topSwitch.isActive = true


}
@objc func mapTypeChanged(_ segmentControl: UISegmentedControl)
    {
    switch segmentControl.selectedSegmentIndex
    {
    case 0: mapView.mapType = .standard
    case 1: mapView.mapType = .hybrid
    case 2: mapView.mapType = .satellite
    default: print("Error")
    }
}
    @objc func mapSwitchPoint(_ withUISwitch: UISwitch)
    {
        switch withUISwitch.isOn
        {
        case true: mapView.pointOfInterestFilter = .includingAll
        case false:mapView.pointOfInterestFilter = .excludingAll
//        default: print("Erorr")
        }
    }
}
