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
    
    
}

extension MapViewModel: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fronOldState oldState: MKAnnotationView.DragState) {
        
    }
    
    func mapView(_ mapView: MKMapView, renderedFor overlay: MKOverlay) -> MKOverlayRenderer{
        
        if overlay is MKCircle {
            let boundCircle = MKCircleRenderer(overlay: overlay)
            boundCircle.strokeColor =  UIColor.orange
            boundCircle.fillColor = UIColor.orange.withAlphaComponent(0.25)
            
            return boundCircle
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
    
}
