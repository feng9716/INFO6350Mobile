//
//  ViewController.swift
//  GetCurrentLocation
//
//  Created by 冯哲宁 on 9/24/22.
//

/**
 1. add the Privacy strings to Info.plist
 2. Set location to whereever you want on the simulator
 3. import location (Feature -> Location -> custom location)
 4. conform to CLLocationManagerDelegate
 5. Add a LocationManager to the code let locationManager = CLLocationManager()
*/

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManger = CLLocationManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }


}

