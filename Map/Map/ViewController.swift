

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var mapview:MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    override func loadView() {
      
        mapview = MKMapView()
        view = mapview
let segmentedControl = UISegmentedControl(items: ["Standard" ,"Hybrid" , "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        
let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 8)
        
let margins = view.layoutMarginsGuide
        
let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
let traillingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        traillingConstraint.isActive = true
        
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChange(segContrl:)), for: .valueChanged)
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "points of interst "
       view.addSubview(label)

        let labelTopConstraint = label.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 9)
        
        let labelLeadingConstraint = label.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
        labelTopConstraint.isActive = true
        labelLeadingConstraint.isActive = true
        
     let swicch = UISwitch()
        swicch.translatesAutoresizingMaskIntoConstraints = false
        swicch.addTarget(self, action: #selector(inerstPoint(sender:)), for: .valueChanged)
        view.addSubview(swicch)
        
        let swichTopConstraint = swicch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 9)
        
        let swichlLeadingConstraint = swicch.leadingAnchor.constraint(equalTo: label.trailingAnchor)
        
        swichTopConstraint.isActive = true
        swichlLeadingConstraint.isActive = true
    }


    @objc func mapTypeChange( segContrl:UISegmentedControl) {
    
    switch segContrl.selectedSegmentIndex {
    case 0:
        
        mapview.mapType = .standard
        
    case 1 :
        
        mapview.mapType = .hybrid
        
    case 2 :
        
        mapview.mapType = .satellite
        
    default:
       print("disWork")
        
    }
}
 
    @objc func inerstPoint(sender:UISwitch){
        
        if sender.isOn == true{
            
            mapview.pointOfInterestFilter = .includingAll
        }else {
        
            mapview.pointOfInterestFilter = .excludingAll
    }
}
}
