//
//  ViewController.swift
//  mapView
//
//  Created by يوسف جابر المالكي on 03/05/1443 AH.
//

import UIKit
import MapKit

class ViewController: UIViewController {
//  step 2 نعرف متغير
    var mapView:MKMapView!
    let lable = UILabel()
    let swiichBtn = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Swich
        swiichBtn.setOn(false, animated: true)
        swiichBtn.addTarget(self, action: #selector(ubdateSwich(_:)), for: .valueChanged)
        swiichBtn.addTarget(self, action: #selector(hidePoints(_:)), for: .valueChanged)
        self.view.addSubview(swiichBtn)
        swiichBtn.translatesAutoresizingMaskIntoConstraints = false
        
           let topSwich =  swiichBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50)
           let leadingSwich =  swiichBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 100)
           let traillingSwich = swiichBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        topSwich.isActive = true
        leadingSwich.isActive = true
        traillingSwich.isActive = true
//        Lable
        self.view.addSubview(lable)
        lable.translatesAutoresizingMaskIntoConstraints = false
           let topLable = lable.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant: 50)
           let leadingLable = lable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 50)
           let traollingLable = lable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        topLable.isActive = true
        leadingLable.isActive = true
        traollingLable.isActive = true
    }
    override func loadView() {
//        step 3
        mapView = MKMapView()
        view = mapView
//      step 4  add segment controll
        let segmentedControl = UISegmentedControl(items: ["Standred","Hybrid","Satillite"])
//        add color اضافة لون للسيقمنت
        segmentedControl.backgroundColor = .systemBackground
//     center top view   جعل السقمنت في منتصف الشاشة فوق
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
//        change maps
        segmentedControl.selectedSegmentIndex = 0
        
        view.addSubview(segmentedControl)
        
// اضافة تحديد للسيقمنت
        let margins = view.layoutMarginsGuide
//        margins put spice leading and trilling by defualt
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10)
        let leadingConstrent = segmentedControl.leadingAnchor.constraint(equalTo:margins.leadingAnchor)
        let traillingConstent = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstrent.isActive = true
        traillingConstent.isActive = true
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
    }
    @objc func mapTypeChanged (_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0 :
            mapView.mapType = .standard
        case 1 :
            mapView.mapType = .hybrid
        case 2 :
            mapView.mapType = .satellite
        default:
            print("erorr")
        }
    }
//    detail lable
    @objc func ubdateSwich(_ ubdate:UISwitch){
        lable.text = swiichBtn.isOn ? "ON":"OFF"
        lable.textColor = .white
        lable.font = UIFont.systemFont(ofSize: 24)
        
    }
//    Action for hide points
    @objc func hidePoints(_ swichHide:UISwitch){
        if swichHide.isOn{
            mapView.pointOfInterestFilter = .excludingAll
        }else{
            mapView.pointOfInterestFilter = .includingAll
        }
        
    }

}

