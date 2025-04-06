//
//  MapView.swift
//  Isladel2
//
//  Created by Josephine Bates on 4/6/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct Request: Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.4837, longitude: -122.8411), // Lopez Island
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    // 🔥 Sample mock requests
    let mockRequests = [
        Request(title: "Diet Coke at Ferry Landing", coordinate: CLLocationCoordinate2D(latitude: 48.491, longitude: -122.871)),
        Request(title: "Milk at Lopez Village Market", coordinate: CLLocationCoordinate2D(latitude: 48.4795, longitude: -122.8417)),
        Request(title: "Bread at Islandale", coordinate: CLLocationCoordinate2D(latitude: 48.474, longitude: -122.832))
    ]

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: mockRequests) { request in
            MapAnnotation(coordinate: request.coordinate) {
                VStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.blue)
                        .font(.title)
                    Text(request.title)
                        .font(.caption)
                        .padding(4)
                        .background(Color.white)
                        .cornerRadius(5)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            locationManager.checkLocationAuthorization()
        }
    }
}

