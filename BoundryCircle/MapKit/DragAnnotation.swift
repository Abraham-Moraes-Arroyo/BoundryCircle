//
//  DragAnnotation.swift
//  BoundryCircle
//
//  Created by Abraham Morales Arroyo on 3/9/24.
//

import Foundation
import UIKit
import MapKit

class DragAnnotation: NSObject, MKAnnotation {
    var title: String?
    var location: CLLocation!
    var coordinate: CLLocationCoordinate2D {
        didSet {
            self.location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        }
    }
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
    }
    func isOutOfBounds(from circle: MKCircle) -> Bool {
        let circleLocation = CLLocation(latitude: circle.coordinate.latitude, longitude: circle.coordinate.longitude)
        
        if let location {
            return self.location.distance(from: circleLocation) > circle.radius

        }
        return false
    }
}
