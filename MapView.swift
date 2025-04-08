//
//  MapView.swift
//  Paws On Tour
//
//  Created by Sam Chutter on 4/7/25.
//

// Views/MapView.swift
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let landmarks: [Landmark]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let sortedLandmarks = landmarks.sorted { $0.order < $1.order }
        let coordinates = sortedLandmarks.map { CLLocationCoordinate2D(latitude: $0.lat, longitude: $0.lon) }
        
        // Add annotations
        uiView.removeAnnotations(uiView.annotations)
        for landmark in sortedLandmarks {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: landmark.lat, longitude: landmark.lon)
            annotation.title = "\(landmark.order). \(landmark.name)"
            annotation.subtitle = landmark.location
            uiView.addAnnotation(annotation)
        }
        
        // Add polyline
        uiView.removeOverlays(uiView.overlays)
        let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
        uiView.addOverlay(polyline)
        
        // Set region
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 29.8885, longitude: -97.94),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        )
        uiView.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = UIColor(red: 90/255, green: 27/255, blue: 31/255, alpha: 0.8)
                renderer.lineWidth = 3
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
}
