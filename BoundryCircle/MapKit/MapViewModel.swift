//
//  MapViewModel.swift
//  BoundryCircle
//
//  Created by Abraham Morales Arroyo on 3/9/24.
//

import Foundation
import SwiftUI
import MapKit

final class MapViewModel: NSObject, ObservableObject {
    // they need their own region
    //where the map is going to be focused
    @Published var mapRegion : MKCoordinateRegion = .init(center: .init(latitude: 38.89897,
                                                                        longitude: -77.02791), span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @Published var alertOutBounds = false
    
}

extension MapViewModel: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        
        if let dragAnnotation = view.annotation as? DragAnnotation, let circle = mapView.overlays.first as? MKCircle, newState.rawValue == 4{
            if dragAnnotation.isOutOfBounds(from: circle){
                alertOutBounds = true
                // try to find an alert to work, we are missing it. 
            }
        }
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer{
        
        if overlay is MKCircle {
            let boundCircle = MKCircleRenderer(overlay: overlay)
            boundCircle.strokeColor =  UIColor.orange
            boundCircle.fillColor = UIColor.orange.withAlphaComponent(0.25)
            
            return boundCircle
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is DragAnnotation {
            let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            marker.markerTintColor = .orange
            marker.isDraggable = true
            return marker
        }
        
        return nil
    }
    
}
