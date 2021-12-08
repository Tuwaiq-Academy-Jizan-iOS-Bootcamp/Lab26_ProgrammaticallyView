//
//  ViewController.swift
//  MaramFaqih_Map
//
//  Created by meme f on 03/05/1443 AH.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    var mapView:MKMapView!
    var pointsInterest:UILabel!
    var switchButton:UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        mapView = MKMapView()
        view = mapView
      
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = 0
        let topConstant = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8)
        topConstant.isActive = true
        let marging = view.layoutMarginsGuide
        let leadingConstant = segmentedControl.leadingAnchor.constraint(equalTo: marging.leadingAnchor)
        leadingConstant.isActive = true
        let trailingConstant = segmentedControl.trailingAnchor.constraint(equalTo: marging.trailingAnchor)
        trailingConstant.isActive = true
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChange(_:)), for: .valueChanged)
        // segmentedControl.bounds.origin.x
        //frame: CGRect(x:0 , y: 0, width: 50, height: 18)
        //UILabel
         pointsInterest = UILabel()
        pointsInterest.font = UIFont.boldSystemFont(ofSize: 16)
         pointsInterest.text = "Points of Interest"
        pointsInterest.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsInterest)
        let topLable =  pointsInterest.topAnchor.constraint(equalTo: segmentedControl.safeAreaLayoutGuide.bottomAnchor,constant: 10)
        let leadingLable =  pointsInterest.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
     
        leadingLable.isActive = true
       topLable.isActive = true
        //UISwitch
        switchButton = UISwitch()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.addTarget(self, action: #selector(self.switchState(_:)), for: .valueChanged)
        switchButton.setOn(true, animated: false)
        view.addSubview(switchButton)
        let topSwitch =  switchButton.topAnchor.constraint(equalTo: segmentedControl.safeAreaLayoutGuide.bottomAnchor,constant: 10)
        let leadingSwitch =  switchButton.leadingAnchor.constraint(equalTo:pointsInterest.leadingAnchor,constant: 150)
        let yLable =  pointsInterest.centerYAnchor.constraint(equalTo: switchButton.centerYAnchor)
        yLable.isActive = true
        topSwitch.isActive = true
        leadingSwitch.isActive = true
       
       
         
        
    }
    
    @objc func mapTypeChange(_ segControl:UISegmentedControl){
        switch segControl.selectedSegmentIndex {
            case 0 :
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .hybrid
            case 2:
                mapView.mapType = .satellite
            default:
                print("Error")
                
            
        }
        
    }
    @objc func switchState(_ sender:UISwitch){
        if (sender.isOn == true){
            
        //mapView.showsPointsOfInterest = true
            mapView.pointOfInterestFilter = .includingAll
            
            
        }
        else{
          //  mapView.showsPointsOfInterest = false
            mapView.pointOfInterestFilter = .excludingAll

            
        }
    }
}

