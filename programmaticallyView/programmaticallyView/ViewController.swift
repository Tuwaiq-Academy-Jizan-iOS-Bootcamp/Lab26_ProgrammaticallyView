//
//  ViewController.swift
//  programmaticallyView
//
//  Created by Amal Jeli on 03/05/1443 AH.
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
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.selectedSegmentIndex = 0
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8)
        view.addSubview(segmentedControl)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingconstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingconstraint.isActive = true
        
      
        segmentedControl.addTarget(self, action: #selector(mapTaype(_:)), for: .valueChanged)

    
    let label = UILabel()
    
    label.text = "point of interset"
    view.addSubview(label)
//        label.backgroundColor = UIColor.white
    label.translatesAutoresizingMaskIntoConstraints = false
    let labeltopConstaint = label.topAnchor.constraint(equalTo: segmentedControl.lastBaselineAnchor,constant: 27)
        
    
        labeltopConstaint.isActive = true
    
        
    
           let SwitchOff = UISwitch()
        SwitchOff.isOn = false
        SwitchOff.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SwitchOff)
        let topConstaintSwitchOff = SwitchOff.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50)
        
//        let leadiningSwitchOff = SwitchOff.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0)
        
        let trailingconstraintSwitchOff = SwitchOff.trailingAnchor.constraint(equalTo: label.trailingAnchor,constant: 50)
        
        
        topConstaintSwitchOff.isActive = true
        trailingconstraintSwitchOff.isActive = true
    
        SwitchOff.addTarget(self, action: #selector(switchButton(_:)), for: .valueChanged)
        
        
    
    }
    
    
    @objc func mapTaype( _ segment:UISegmentedControl){
        switch segment.selectedSegmentIndex {
        case 0 :
            mapView.mapType = .standard
        case 1 :
            mapView.mapType = .hybrid
        case 2 :
            mapView.mapType = .satellite
        default :
            print ("Error")
        }
    }
    
    
    @objc func switchButton(_ sender:UISwitch){
            if sender.isOn {
                mapView.pointOfInterestFilter = .excludingAll
            }else{
                    mapView.pointOfInterestFilter = .includingAll
                }
            }
    
    

}

