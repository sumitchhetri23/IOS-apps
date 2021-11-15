//
//  ContentView.swift
//  calculator
//
//  Created by macOS on 3/21/1400 AP.
//  Copyright © 1400 macOS. All rights reserved.
//

import SwiftUI
import MapKit

struct policeStationStr: Identifiable {
    var id = UUID()
    var name: String
    var place: String
    var latitude: Double
    var longitude: Double
    var imagePlace: String { return place }
    var region: MKCoordinateRegion
    var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    let policeStations:[policeStationStr] = [
        policeStationStr(name: "Los Angeles Police Station", place: "Los Angeles", latitude: 34.052235, longitude: -118.243683,region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.052235, longitude: -118.243683),span:  MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)),coordinate: .init(latitude: 34.052235, longitude: -118.243683)),
        policeStationStr(name: "South Carolina Police Station", place: "South Carolina", latitude: 33.836082, longitude: -81.163727,region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.836082, longitude: -81.163727),span:  MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)),coordinate: .init(latitude: 33.836082, longitude: -81.163727)),
        policeStationStr(name: "Pennsylvania Police Station", place: "Pennsylvania", latitude: 41.203323, longitude: -77.194527,region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.203323, longitude: -77.194527),span:  MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)),coordinate: .init(latitude: 41.203323, longitude: -77.194527)),
        policeStationStr(name: "Michigan Police Station", place: "Michigan", latitude: 44.182205, longitude: -84.506836,region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 44.182205, longitude: -84.506836),span: MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)),coordinate: .init(latitude: 44.182205, longitude: -84.506836)),
        policeStationStr(name: "Minnesota Police Station", place: "Minnesota", latitude: 46.392410, longitude: -94.636230,region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 46.392410, longitude: -94.636230),span:  MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)),coordinate: .init(latitude: 46.392410, longitude: -94.636230)),
        policeStationStr(name: "California Police Station", place: "California", latitude: 36.778259, longitude: -119.417931,region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.778259, longitude: -119.417931),span: MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)),coordinate: .init(latitude: 36.778259, longitude: -119.417931)),
        policeStationStr(name: "Florida Police Station", place: "Florida", latitude: 27.994402, longitude: -81.760254,region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 27.994402, longitude: -81.760254),span: MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)),coordinate: .init(latitude: 27.994402, longitude: -81.760254)),
        policeStationStr(name: "Hawaii Police Station", place: "Hawaii", latitude: 19.741755, longitude: -155.844437,region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.741755, longitude: -155.844437),span:  MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)),coordinate: .init(latitude: 19.741755, longitude: -155.844437)),
        policeStationStr(name: "Alaska Police Station", place: "Alaska", latitude: 66.160507, longitude: -153.369141,region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 66.160507, longitude: -153.369141),span:  MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)),coordinate: .init(latitude: 66.160507, longitude: -153.369141)),
        policeStationStr(name: "Colorado Police Station", place: "Colorado", latitude: 39.113014, longitude: -105.358887,region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.113014, longitude: -105.358887),span:  MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)),coordinate: .init(latitude: 39.113014, longitude: -105.358887))
   ]
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    ForEach(policeStations) { address in
                        addressList(address: address)
                            .frame(maxWidth: .infinity)
                    }
                }
            }.background(Color.blue)
            .navigationBarTitle("Police Stations", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct addressList: View {
    let address: policeStationStr
    var body: some View {
        NavigationLink(destination:singlePlace( name: address.name,place: address.place, latitude: address.latitude, longitude: address.longitude, region: address.region, coordinate:address.coordinate)) {
                HStack {
                    Image(address.imagePlace)
                        .resizable()
                            .frame(width: 100, height: 80)
                            .cornerRadius(12)
                    VStack {
                        Text(address.name)
                            .foregroundColor(Color.black)
                        Text(address.place)
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                }
                .frame(width: 200, height: 80)
                Spacer()
            }
        }
    }
}
