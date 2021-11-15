import SwiftUI
import MapKit

struct placeAddress: Identifiable{
    var id = UUID()
    var name: String
    var place: String
    var coordinate: CLLocationCoordinate2D
}
struct singlePlace: View {
    var annotationsObjs = [
        placeAddress(name: "Los Angeles Police Station", place: "Los Angeles", coordinate: .init(latitude: 34.052235, longitude: -118.243683)),
        placeAddress(name: "South Carolina Police Station", place: "South Carolina", coordinate: .init(latitude: 33.836082, longitude: -81.163727)),
        placeAddress(name: "Pennsylvania Police Station", place: "Pennsylvania", coordinate: .init(latitude: 41.203323, longitude: -77.194527)),
        placeAddress(name: "Michigan Police Station", place: "Michigan", coordinate: .init(latitude: 44.182205, longitude: -84.506836)),
        placeAddress(name: "Minnesota Police Station", place: "Minnesota", coordinate: .init(latitude: 46.392410, longitude: -94.636230)),
        placeAddress(name: "California Police Station", place: "California", coordinate: .init(latitude: 36.778259, longitude: -119.417931)),
        placeAddress(name: "Florida Police Station", place: "Florida", coordinate: .init(latitude: 27.994402, longitude: -81.760254)),
        placeAddress(name: "Hawaii Police Station", place: "Hawaii", coordinate: .init(latitude: 19.741755, longitude: -155.844437)),
        placeAddress(name: "Alaska Police Station", place: "Alaska", coordinate: .init(latitude: 66.160507, longitude: -153.369141)),
        placeAddress(name: "Colorado Police Station", place: "Colorado", coordinate: .init(latitude: 39.113014, longitude: -105.358887))
    ]
    
    var name: String
    var place: String
    var latitude: Double
    var longitude: Double
   @State var region: MKCoordinateRegion
   var coordinate: CLLocationCoordinate2D

    var body: some View {
           ZStack{
            Map(coordinateRegion: $region, annotationItems: annotationsObjs, annotationContent:{
                    item in
                    MapPin(coordinate: item.coordinate, tint: .green)
                
            })
            NavigationLink(destination: ContentView()) {
                Image("close")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .offset(x: -5,y: 0)
                    .padding(.top, 5)
               }

                    }
                }
        }
struct singlePlace_Previews: PreviewProvider {
    static var previews: some View {
        singlePlace(name:"Ohio",place:"Ohio",latitude: -9.25, longitude: -8.25, region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -9.25, longitude: -8.25),span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)),coordinate: CLLocationCoordinate2D(latitude: -9.25, longitude: -8.25))
    }
}
