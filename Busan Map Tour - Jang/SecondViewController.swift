//
//  SecondViewController.swift
//  Busan Map Tour - Jang
//
//  Created by D7702_10 on 2017. 10. 12..
//  Copyright © 2017년 D7702_10. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "address", ofType: "plist")
        print("path = \(String(describing: path))")
        
        let contents = NSArray(contentsOfFile: path!)
        print("path = \(String(describing: contents))")
        
        var annotations = [MKPointAnnotation]()
        
        myMap.delegate = self
        
        
        // optional binding
        if let myItems = contents {
            // Dictionary Array에서 값 뽑기
            for item in myItems {
                let address = (item as AnyObject).value(forKey: "address")
                let title = (item as AnyObject).value(forKey: "title")
                
                let geoCoder = CLGeocoder()
                
                geoCoder.geocodeAddressString(address as! String, completionHandler: { placemarks, error in
                    
                    if error != nil {
                        print(error!)
                        return
                    }
                    
                    if let myPlacemarks = placemarks {
                        let myPlacemark = myPlacemarks[0]
                        
                        print("placemark[0] = \(String(describing: myPlacemark.name))")
                        
                        let annotation = MKPointAnnotation()
                        annotation.title = title as? String
                        annotation.subtitle = address as? String
                        
                        if let myLocation = myPlacemark.location {
                            annotation.coordinate = myLocation.coordinate
                            annotations.append(annotation)
                        }
                        
                    }
                    print("annotations = \(annotations)")
                    self.myMap.showAnnotations(annotations, animated: true)
                    self.myMap.addAnnotations(annotations)
                    
                })
            }
        } else {
            print("contents의 값은 nil")
        }
    }

    
}
