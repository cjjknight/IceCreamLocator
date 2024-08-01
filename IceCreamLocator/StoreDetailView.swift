import SwiftUI
import CoreLocation

struct StoreDetailView: View {
    @EnvironmentObject var locationManager: LocationManager
    let store: IceCreamStore

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(store.name)")
                .font(.title)
            Text("Address: \(store.address)")
            Text("Phone: \(store.phone)")
            if let userLocation = locationManager.location {
                Text("Distance: \(distance(from: userLocation)) km")
            } else {
                Text("Calculating distance...")
            }
            Spacer()
        }
        .padding()
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func distance(from location: CLLocation) -> String {
        let storeLocation = CLLocation(latitude: store.latitude, longitude: store.longitude)
        let distanceInMeters = location.distance(from: storeLocation)
        let distanceInKilometers = distanceInMeters / 1000
        return String(format: "%.2f", distanceInKilometers)
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: IceCreamStore(name: "Sample Store", address: "123 Main St", phone: "555-555-5555", latitude: 34.0, longitude: -89.0))
            .environmentObject(LocationManager())
    }
}
