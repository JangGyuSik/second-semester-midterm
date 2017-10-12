//
//  DetailViewController.swift
//  Busan Map Tour - Jang
//
//  Created by D7702_10 on 2017. 10. 10..
//  Copyright © 2017년 D7702_10. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    var titleData : String?
    var addressData : String?

    
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = navigationController?.title
        // Do any additional setup after loading the view.

        print(addressData as Any)
        let geoCoder2: CLGeocoder = CLGeocoder()
        let myAddress = addressData
        geoCoder2.geocodeAddressString(myAddress!, completionHandler: {
            (placemarks, error) -> Void in
            
            let myCoordinate = placemarks?[0]
            let lat = myCoordinate?.location?.coordinate.latitude
            let long = myCoordinate?.location?.coordinate.longitude
            
            let center = CLLocationCoordinate2DMake(lat!, long!)
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegionMake(center, span)
            self.myMap.setRegion(region, animated: true)
            
            // pin annotation
            let anno = MKPointAnnotation()
            anno.coordinate.latitude = lat!
            anno.coordinate.longitude = long!
            anno.title = self.titleData
            anno.subtitle = self.addressData
            self.myMap.addAnnotation(anno)
            self.myMap.selectAnnotation(anno, animated: true)
            
            if error != nil {
                print(error!)
            } else{
                
            }
        })
    }
}
