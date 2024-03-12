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
        .alert(isPresented: $mapVM.alertOutBounds) { // This listens to the alertOutBounds property from the view model
            Alert(
                title: Text("Out of Bounds"),
                message: Text("Your pin must be inside of New City."),
                dismissButton: .default(Text("OK"), action: {
                    
                })
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

