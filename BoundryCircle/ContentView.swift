//
//  ContentView.swift
//  BoundryCircle
//
//  Created by Abraham Morales Arroyo on 3/9/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    
    @StateObject private var mapVM = MapViewModel()
    
    
    var body: some View {
        ZStack {
            MKMapRep(mapVM: mapVM)
                .ignoresSafeArea()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
