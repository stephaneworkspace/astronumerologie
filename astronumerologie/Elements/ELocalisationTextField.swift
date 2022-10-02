//
// Created by Stéphane on 06.09.22.
//

import Foundation
import SwiftUI
import CoreLocation

struct ELocalisationTextField: View {
    @Binding var bdLat: Double
    @Binding var bdLng: Double
    @Binding var biTimeZone: Int
    @State var sL: L
    @FocusState private var fbLat: Bool
    @FocusState private var fbLng: Bool

    var body: some View {
        VStack {
            HStack {
                Text("\(LLatitude(L: sL))")
                        .font(FONTSYSTEM)
                        .clipped()
                TextField(
                        "\(LLatitude(L: sL))",
                        value: $bdLat,
                        formatter: FORMATTER
                )
                        .focused($fbLat)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(FONTSYSTEM)
                        .clipped()
                Text("\(LLongitude(L: sL))")
                        .font(FONTSYSTEM)
                        .clipped()
                TextField(
                        "\(LLongitude(L: sL))",
                        value: $bdLng,
                        formatter: FORMATTER
                )
                        .focused($fbLng)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                if CLLocationManager.authorizationStatus() == .restricted
                           || CLLocationManager.authorizationStatus() == .denied {

                } else {
                    Button(action: {
                        if (CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                                CLLocationManager.authorizationStatus() == .authorizedAlways) {
                            let locationManager = CLLocationManager()
                            locationManager.requestWhenInUseAuthorization()
                            var currentLoc: CLLocation!
                            currentLoc = locationManager.location
                            fbLat = false
                            fbLng = false
                            bdLat = currentLoc.coordinate.latitude
                            bdLng = currentLoc.coordinate.longitude
                        }
                    }, label: {
                        ZStack {
                            Image(systemName: "location.circle")
                                    .imageScale(IMAGESCALE)
                                    .foregroundColor(FOREGROUNDCOLOR)
                        }
                    })
                }

            }
            HStack {
                Picker("", selection: $biTimeZone, content: {
                    ForEach(-12...0, id: \.self) { idx in
                        if idx != 0 {
                            Text("GMT " + idx.formatted()).tag(idx)
                        }
                    }
                    ForEach(0...12, id: \.self) { idx in
                        Text("GMT +" + idx.formatted()).tag(idx)
                    }
                })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(FOREGROUNDCOLOR)
                        .font(FONTSYSTEM)
                        .pickerStyle(WheelPickerStyle())
            }
            Spacer()
        }.padding()
    }
}
