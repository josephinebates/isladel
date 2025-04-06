//
//  LocationManager.swift
//  Isladel2
//
//  Created by Josephine Bates on 4/6/25.
//


import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func checkLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            switch manager.authorizationStatus {
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
            case .restricted, .denied:
                print("Location access denied.")
            case .authorizedWhenInUse, .authorizedAlways:
                manager.startUpdatingLocation()
            @unknown default:
                break
            }
        } else {
            print("Location services are disabled.")
        }
    }
}
