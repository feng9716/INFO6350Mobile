//
//  ViewController.swift
//  WeatherForcast
//
//  Created by 冯哲宁 on 11/19/22.
//

import UIKit
import CoreLocation
import SwiftyJSON
import Alamofire

class ViewController: UIViewController,CLLocationManagerDelegate,UITableViewDelegate, UITableViewDataSource {
    let locationManager = CLLocationManager()
    var lat = 0.0
    var lng = 0.0
    var temperatures = [] as [String]
    
    @IBOutlet weak var tempTbl: UITableView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var locationTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation()
        
        tempTbl.delegate = self
        tempTbl.dataSource = self
        
    }

    @IBAction func forecastCurrentLocationAction(_ sender: Any) {
        self.temperatures = [] as [String]
        let locationString = "\(self.lat),\(self.lng)"
        var url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations="
        url += locationString
        url += "&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key=AYQR6QM5KHFYVPH9M4EXXJUCC"

        print(locationString)
        AF.request(url).responseJSON{
            response in
            if(response.error != nil){
                print(response.error);
                return;
            }

            let weatherData = JSON(response.data as Any)
            print(weatherData)
           // guard let stock = JSON(responseData.data!).array else { return }
            let forecastValues =  weatherData["locations"][locationString]["values"]
            print(forecastValues.count)

            for forecast in forecastValues {
                let forecastJSON = JSON(forecast.1)
                let temp = forecastJSON["temp"].floatValue
//                print(temp)
                let condition = forecastJSON["conditions"]
                self.temperatures.append("Temperature: \(String(temp)), Condition: \(condition)")
            }
            
            self.tempTbl.reloadData()
            self.cityLbl.text = locationString
        }
        
    }
    
    @IBAction func forecastInputLocationAction(_ sender: Any) {
        self.temperatures = [] as [String]
        var locationString = locationTxt.text!
        var url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations="
        url += locationString
        url += "&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key=AYQR6QM5KHFYVPH9M4EXXJUCC"
        
        AF.request(url).responseJSON { responseData in
            //print(responseData)
            if responseData.error != nil {

                print(responseData.error!)

                return

            }
            let weatherData = JSON(responseData.data as Any)

           // guard let stock = JSON(responseData.data!).array else { return }
            let forecastValues =  weatherData["locations"][locationString]["values"]
            print(forecastValues.count)
            
            for forecast in forecastValues {
                let forecastJSON = JSON(forecast.1)
                let temp = forecastJSON["temp"].floatValue
                let condition = forecastJSON["conditions"]
                self.temperatures.append("Temperature: \(String(temp)), Condition: \(condition)")
            }
            
            self.tempTbl.reloadData()
            self.cityLbl.text = locationString
            self.locationTxt.text=""
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
        self.lat = lat
        self.lng = lng
        
        
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
        
    func getAddressFromLocation(location: CLLocation){
        let clGeoCoder = CLGeocoder()
        var address = ""
        clGeoCoder.reverseGeocodeLocation(location) { placeMarks, error in
            if(error != nil){
                print(error?.localizedDescription)
                return
            }
            
            guard let place = placeMarks?.first else {return}
            if(place.name != nil){
                address += (place.name! + ", ")
            }
            if(place.subLocality != nil){
                address += (place.name! + ", ")
            }
            if(place.locality != nil){
                address += (place.locality! + ", ")
            }
            if(place.administrativeArea != nil){
                address += (place.administrativeArea! + ", ")
            }
            if(place.postalCode != nil){
                address += (place.postalCode! + ", ")
            }
            if(place.country != nil){
                address += (place.country! + ", ")
            }
            print(address);
        }
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temperatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TemperatureTableViewCell
        
        cell.temperatureLbl.text = "\(self.temperatures[indexPath.row])"
        
        return cell
    }
}

