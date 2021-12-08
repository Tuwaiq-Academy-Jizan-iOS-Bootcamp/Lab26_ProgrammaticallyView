//
//  ViewController.swift
//  Mapview
//
//  Created by زهور حسين on 03/05/1443 AH.
//

import UIKit
import MapKit
class ViewController: UIViewController {
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        //اضافة لون
        segmentedControl.backgroundColor = UIColor.systemBackground
        // السقمنت في نص الشاشه
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        // تحديد للسقمينت
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        let traillingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        traillingConstraint.isActive = true
        segmentedControl.addTarget(self, action: #selector(mapTaypechange(_:)), for: .valueChanged)
        
        let lable = UILabel()
        lable.text = "point of interset"
        view.addSubview(lable)
        lable.translatesAutoresizingMaskIntoConstraints = false
        let labletopConstaint = lable.topAnchor.constraint(equalTo: segmentedControl.lastBaselineAnchor,constant: 20)
        
        labletopConstaint.isActive = true
        
        let statusSW = UISwitch()
        statusSW.isOn = false
        statusSW.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusSW)
        // بحدد مكان السويتش او حدوده
        let topConstaintstatusSW = statusSW.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50)
        
        let trailingconstraintstatusSW = statusSW.trailingAnchor.constraint(equalTo: lable.trailingAnchor,constant: 50)
        
        topConstaintstatusSW.isActive = true
        trailingconstraintstatusSW.isActive = true
        statusSW.addTarget(self, action: #selector(SWchange), for: .valueChanged)
    }
    @objc func mapTaypechange(_ segControl:UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0 :
            mapView.mapType = .standard
        case 1 :
            mapView.mapType = .hybrid
        case 2 :
            mapView.mapType = .satellite
        default :
        print("Erorr")
        
    }

}
    
 
  @IBAction func SWchange(_ sender: UISwitch) {
      if sender.isOn {
          mapView.pointOfInterestFilter = .excludingAll
      }else{
          mapView.pointOfInterestFilter = .includingAll
      }
    print("status = \(sender.isOn )")
   //   statusSW = sender.isOn
        
      //   var statusSW : UISwitch {
        //  let statusSW = UISwitch()
         // statusSW.isOn = false
             // statusSW.translatesAutoresizingMaskIntoConstraints = false
          //  statusSW.addTarget(self, action: #selector(Buttonchange), for: .valueChanged)
           //  return statusSW
    }
}

