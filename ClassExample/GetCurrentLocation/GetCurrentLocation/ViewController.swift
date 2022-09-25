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
        locationManger.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
        print(lat)
        print(lng)
    }

    @IBAction func getLocation(_ sender: Any){
        locationManger.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

