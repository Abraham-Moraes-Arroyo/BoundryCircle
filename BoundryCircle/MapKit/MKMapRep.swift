//
//  MKMapRep.swift
//  BoundryCircle
//
//  Created by Abraham Morales Arroyo on 3/9/24.
//

import Foundation
import SwiftUI
import MapKit

struct MKMapRep: UIViewRepresentable{
    
    @ObservedObject var mapVM: MapViewModel
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        mapView.region = context.coordinator.mapRegion
        
        mapView.delegate = context.coordinator
        
        let circle = MKCircle(center: context.coordinator.mapRegion.center, radius: 15000)
        mapView.setVisibleMapRect(circle.boundingMapRect, edgePadding: .init(top: 30, left: 50, bottom: 20, right: 50), animated: true)
        mapView.addOverlay(circle)
        // change the hardcoded sgtring to a state variable. 
        let dragAnnotation = DragAnnotation(title: "Drag Me!!!", coordinate: context.coordinator.mapRegion.center)
        mapView.addAnnotation(dragAnnotation)
            
        return mapView
        
    }
    
    func makeCoordinator() -> MapViewModel {
        return mapVM
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
    
    typealias UIViewType = MKMapView
    
}
