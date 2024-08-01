import SwiftUI
import CoreLocation

struct StoreDetailView: View {
    @EnvironmentObject var locationManager: LocationManager
    let store: IceCreamStore

    var body: some View {
        VStack {
            if let userLocation = locationManager.location, let heading = locationManager.heading {
                ArrowView(direction: calculateDirection(userLocation: userLocation, storeLocation: CLLocation(latitude: store.latitude, longitude: store.longitude), heading: heading))
                    .frame(width: 200, height: 200)
                
                Text("Distance: \(distance(from: userLocation)) km")
                    .padding(.top, 20)
                    .font(.title)
            } else {
                Text("Calculating direction and distance...")
                    .padding()
                    .font(.title)
            }
            Spacer()
        }
        .padding()
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            locationManager.startUpdating()
        }
        .onDisappear {
            locationManager.stopUpdating()
        }
    }
    
    private func calculateDirection(userLocation: CLLocation, storeLocation: CLLocation, heading: CLHeading) -> Double {
        let bearing = getBearingBetweenTwoPoints1(location1: userLocation.coordinate, location2: storeLocation.coordinate)
        let direction = (bearing - heading.trueHeading).truncatingRemainder(dividingBy: 360)
        return direction
    }
    
    private func getBearingBetweenTwoPoints1(location1: CLLocationCoordinate2D, location2: CLLocationCoordinate2D) -> Double {
        let lat1 = location1.latitude.toRadians()
        let lon1 = location1.longitude.toRadians()
        let lat2 = location2.latitude.toRadians()
        let lon2 = location2.longitude.toRadians()
        
        let dLon = lon2 - lon1
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let bearing = atan2(y, x).toDegrees()
        
        return (bearing + 360).truncatingRemainder(dividingBy: 360)
    }

    private func distance(from location: CLLocation) -> String {
        let storeLocation = CLLocation(latitude: store.latitude, longitude: store.longitude)
        let distanceInMeters = location.distance(from: storeLocation)
        let distanceInKilometers = distanceInMeters / 1000
        return String(format: "%.2f", distanceInKilometers)
    }
}

extension Double {
    func toRadians() -> Double {
        return self * .pi / 180
    }

    func toDegrees() -> Double {
        return self * 180 / .pi
    }
}
