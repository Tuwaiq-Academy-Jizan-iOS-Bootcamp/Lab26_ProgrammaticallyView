

import UIKit
import MapKit

class ViewController: UIViewController {

    var mapView : MKMapView!
    
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
        }
