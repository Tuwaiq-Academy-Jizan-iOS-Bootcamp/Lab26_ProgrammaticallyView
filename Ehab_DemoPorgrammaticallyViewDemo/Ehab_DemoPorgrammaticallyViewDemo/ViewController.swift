//
//  ViewController.swift
//  Ehab_DemoPorgrammaticallyViewDemo
//
//  Created by Ehab Hakami on 03/05/1443 AH.
//

import UIKit
//تستدعي فريمورك الماب كت
import MapKit
class ViewController: UIViewController {
    
    //  j     تستدعيه في متغير عشان تستخدمو في الفيو لود فنكشن كانك حطيتو في اوتلت
    var mapView:MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        
        // initlazat object
        mapView = MKMapView()
        
        // m م تظهر الفيو حق الماب الا بعد م تحط ذي تحت
        view = mapView
        
        
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        
    
        
        
        // d  systemBackground اذا تبغا دارك مود لازم تحط اللون
        segmentedControl.backgroundColor = UIColor.systemBackground
        
        // z حق الكونسرت عشان تشتغل التوب انكر والليد انكر و التريلنق انكر
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        
        
        view.addSubview(segmentedControl)
        
        
        let topConstraiont = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        
        let leadingContraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        let traillingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        
        topConstraiont.isActive = true
        leadingContraint.isActive = true
        traillingConstraint.isActive = true
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChaned(_:)), for: .valueChanged)
        
        
        
           let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))



           
           label.textColor = .black


           label.center = CGPoint(x: 65, y: 100)

          
           label.textAlignment = .center

           label.text = "Point Of Interst: "

           self.view.addSubview(label)
        
        let switchButton = UISwitch(frame: CGRect(x: 0, y: 0, width: 80, height: 100))
        switchButton.center = CGPoint(x: 150, y: 100)
                self.view.addSubview(switchButton)
        switchButton.addTarget(self, action: #selector(mapPoint(_:)), for: .valueChanged)
    }

    @objc func mapTypeChaned(_ segControl:UISegmentedControl) {
        
        switch segControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default :
            print("Eerorr")
        }
        
    }
    
    @objc func mapPoint(_ switchBtn:UISwitch) {
        
        switch switchBtn.isOn{
        case true:
            mapView.pointOfInterestFilter = .includingAll
        case false:
            mapView.pointOfInterestFilter = .excludingAll
        }
        
    }

}

//  the place where  get seystm object تعريف السيف اريا
