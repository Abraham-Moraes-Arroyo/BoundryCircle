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
        
        let circle = MKCircle(center: mapView.region.center, radius: 1000)
        mapView.setVisibleMapRect(circle.boundingMapRect, edgePadding: .init(top: 30, left: 100, bottom: 20, right: 100), animated: true)
        mapView.addOverlay(circle)
            
        return mapView
        
    }
    
    func makeCoordinator() -> MapViewModel {
        return mapVM
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
    
    typealias UIViewType = MKMapView
    
}
