

import UIKit
import MapKit

class ViewController: UIViewController {

    var mapView : MKMapView!
    let switchPoint = UISwitch()
    let labelPoint = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func loadView() {
mapView = MKMapView()
        view = mapView
        
        let segmentedControler = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        
        segmentedControler.backgroundColor = UIColor.systemBackground
        segmentedControler.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControler)
       
        let topConstraint =
           segmentedControler.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant: 8)
            let margins = view.layoutMarginsGuide
          
        let leadingConstraint =
            segmentedControler.leadingAnchor.constraint(equalTo:margins.leadingAnchor)
           
        let traillingConstraint =
            segmentedControler.trailingAnchor.constraint(equalTo:margins.trailingAnchor)
          
        topConstraint.isActive = true
            leadingConstraint.isActive = true
            traillingConstraint.isActive = true
          segmentedControler.addTarget(self,action:#selector(mapTypeChanged(_:)), for:.valueChanged)
        
        
        let switchPoint = UISwitch()
        
        let labelPoint = UILabel()
        labelPoint.text = "Point of Intrest"
        labelPoint.backgroundColor = .systemBackground
        labelPoint.textColor = .systemOrange
        labelPoint.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControler.backgroundColor = UIColor.systemBackground
        
        segmentedControler.selectedSegmentTintColor = .systemYellow
        segmentedControler.translatesAutoresizingMaskIntoConstraints = false
        segmentedControler.selectedSegmentIndex = 0
        
        switchPoint.translatesAutoresizingMaskIntoConstraints = false
        switchPoint.onTintColor = .systemOrange
        switchPoint.isOn = true
        switchPoint.setOn(true, animated: false)
        view.addSubview(switchPoint)
        view.addSubview(segmentedControler)
        
        // label
          view.addSubview(labelPoint)
         let topLabel = labelPoint.topAnchor.constraint(equalTo: segmentedControler.bottomAnchor, constant: 22)
         let leftLabel = labelPoint.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 22)
          topLabel.isActive = true
          leftLabel.isActive = true
        
        //Switch
        let topSwitch = switchPoint.topAnchor.constraint(equalTo: segmentedControler.bottomAnchor, constant: 11)
          let leftSwitch = switchPoint.leftAnchor.constraint(equalTo: labelPoint.rightAnchor, constant: 11)
          topSwitch.isActive = true
          leftSwitch.isActive = true
          switchPoint.addTarget(self, action: #selector(mapSwitchPoint(_:)), for: .valueChanged)
        
        
          }
    
        @objc func mapTypeChanged(_ segContro:UISegmentedControl){ switch segContro.selectedSegmentIndex {
        case 0 :
          mapView.mapType = .standard
        case 1 :
          mapView.mapType = .hybrid
        case 2 :
          mapView.mapType = .satellite
        default :
          print("Error")
        }
        }
    
    
    @objc func mapSwitchPoint(_ withUISwitch: UISwitch)
      {
        switch withUISwitch.isOn
        {
        case true: mapView.pointOfInterestFilter = .includingAll
        case false:mapView.pointOfInterestFilter = .excludingAll
  
        }
    
        }
}
