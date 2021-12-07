//
//  ViewController.swift
//  ArwaAlattas_ProgrammaticallyView
//
//  Created by Arwa Alattas on 03/05/1443 AH.
//

import UIKit
import MapKit
class ViewController: UIViewController {
   
    var mapView:MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        
        mapView = MKMapView()
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standerd","Hybrid","Satellite"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        
        let margins = view.layoutMarginsGuide
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8)
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trallingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trallingConstraint.isActive = true
        
        segmentedControl.addTarget(self, action: #selector(changeMapType(_:)), for:.valueChanged)
        
        let  label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Point of interest"
        view.addSubview(label)

        let labelTopConstraint = label.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor,constant: 10)
//       let labelTrallingConstraint = label.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        let labelLeadingConstraint = label.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
        labelTopConstraint.isActive = true
        labelLeadingConstraint.isActive = true
//      labelTrallingConstraint.isActive = true
        
        let swich = UISwitch()
        swich.translatesAutoresizingMaskIntoConstraints = false

        swich.addTarget(self, action: #selector(getInterstPoint(_:)), for: .valueChanged)
        view.addSubview(swich)
        
        
        let swichTopConstraint = swich.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor,constant: 10)
        let swichLeadingConstraint = swich.leadingAnchor.constraint(equalTo: label.trailingAnchor,constant: 10)
        swichTopConstraint.isActive = true
        swichLeadingConstraint.isActive = true
        
    }

  @objc  func changeMapType(_ segmentedcotrol:UISegmentedControl){
        switch segmentedcotrol.selectedSegmentIndex{
        case 0 :mapView.mapType = .standard
        case 1 :mapView.mapType = .hybrid
        case 2 :mapView.mapType = .satellite
        default:
            print("Error")
        }
        
    }
    
    @objc func getInterstPoint(_ sender:UISwitch){
        if sender.isOn == true {
            mapView.pointOfInterestFilter = .includingAll
            
        }else{
            
            mapView.pointOfInterestFilter = .excludingAll
            
        }
        
        
        
    }
    
    
}

