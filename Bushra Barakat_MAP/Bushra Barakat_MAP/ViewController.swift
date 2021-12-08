//
//  ViewController.swift
//  Bushra Barakat_MAP
//
//  Created by Bushra Barakat on 03/05/1443 AH.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    var mapView : MKMapView!
    var nameLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
    
        mapView = MKMapView()
        view = mapView
        let segmentControl = UISegmentedControl (items: ["Standard", "Hybrid","Satellite"])
        segmentControl.backgroundColor = UIColor.systemBackground
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.selectedSegmentIndex = 0
        view.addSubview(segmentControl)
        let margins = view.layoutMarginsGuide
        
        
        let topConstraint = segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20)
        let leadingConstraint = segmentControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trallingConstraint = segmentControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trallingConstraint.isActive = true
        
        segmentControl.addTarget(self, action: #selector(changeMapType(_:)), for: .valueChanged)  // call function
        
//        ______________label__________________________
//
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textColor = UIColor.black
        label.text = "Point Of Interest"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        
        let topLabelConstraint = label.topAnchor.constraint(equalTo: margins.topAnchor,constant: 65)
        let leadingLabelConstraint = label.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trallingLabelConstraint = label.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        topLabelConstraint.isActive = true
        leadingLabelConstraint.isActive = true
        trallingConstraint.isActive = true
        
//       ___________________switch________________________
        
        let switchControl = UISwitch()
        switchControl.onTintColor = UIColor.green
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(switchControl)
        
        
        let topSwitchConstraint = switchControl.topAnchor.constraint(equalTo: margins.topAnchor, constant: 60)
        let leadingSwitchConstraint = switchControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 150)
        let trallingSwitchConstraint = switchControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        topSwitchConstraint.isActive = true
        leadingSwitchConstraint.isActive = true
        trallingSwitchConstraint.isActive = true
        
        switchControl.addTarget(self, action: #selector(changeButton(_:)), for: .valueChanged)
        

    }


    @objc func changeMapType (_ segmentControl: UISegmentedControl){
        switch segmentControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            print ("Error")
            
        }
    }
    
    
    @objc func changeButton (_ switchControl: UISwitch){
        if switchControl.isOn {
            mapView.pointOfInterestFilter = .excludingAll
        }else{
            mapView.pointOfInterestFilter = .includingAll
        }
    }
    
}

