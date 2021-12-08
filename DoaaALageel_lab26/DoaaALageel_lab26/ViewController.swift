//
//  ViewController.swift
//  DoaaALageel_lab26
//
//  Created by Dua'a ageel on 04/05/1443 AH.
//

import UIKit
import MapKit
class ViewController: UIViewController {
    var mapView: MKMapView!
    var pointOfInterest:UILabel!
        var switchPoint:UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
    mapView = MKMapView()
        view = mapView
        let segmentedControl = UISegmentedControl(items: ["Standare", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = 0
        
        let topConstsnt = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8)
        topConstsnt.isActive = true
        let maring = view.layoutMarginsGuide
        let leadingConstsnt = segmentedControl.leadingAnchor.constraint(equalTo: maring.leadingAnchor)
        leadingConstsnt.isActive = true
        let tralingConstant = segmentedControl.trailingAnchor.constraint(equalTo: maring.trailingAnchor)
        tralingConstant.isActive = true
        segmentedControl.addTarget(self, action: #selector(mapTypeChange(_:)), for: .valueChanged)
        
        pointOfInterest = UILabel()
        pointOfInterest.font = UIFont.boldSystemFont(ofSize: 17)
        pointOfInterest.text = "Points of Interest"
        pointOfInterest.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(pointOfInterest)
                let topLable =  pointOfInterest.topAnchor.constraint(equalTo: segmentedControl.safeAreaLayoutGuide.bottomAnchor,constant: 10)
                let leadingLable =  pointOfInterest.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
             
                leadingLable.isActive = true
               topLable.isActive = true
        
        
        
        switchPoint = UISwitch()
        switchPoint.translatesAutoresizingMaskIntoConstraints = false
        switchPoint.addTarget(self, action: #selector(self.switchState(_:)), for: .valueChanged)
                switchPoint.setOn(true, animated: false)
                view.addSubview(switchPoint)
                let topSwitch =  switchPoint.topAnchor.constraint(equalTo: segmentedControl.safeAreaLayoutGuide.bottomAnchor,constant: 10)
                let leadingSwitch =  switchPoint.leadingAnchor.constraint(equalTo:pointOfInterest.leadingAnchor,constant: 160)
                let yLable =  pointOfInterest.centerYAnchor.constraint(equalTo: switchPoint.centerYAnchor)
                yLable.isActive = true
                topSwitch.isActive = true
                leadingSwitch.isActive = true
        
        
        
    }
    @objc func switchState(_ sender:UISwitch){
            if (sender.isOn == true){
                
           
                mapView.pointOfInterestFilter = .includingAll
                
                
            }
            else{
           
                mapView.pointOfInterestFilter = .excludingAll

                
            }
        }
    
    @objc func mapTypeChange(_ segControl:UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0 :
            mapView.mapType = .standard
        case 1 :
            mapView.mapType = .hybrid
        case 2 :
            mapView.mapType = .satellite
        default:
            print("error")
            
            
            
            
        }
    }
    
    
    
    
}

