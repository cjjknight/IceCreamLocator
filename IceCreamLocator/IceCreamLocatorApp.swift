import SwiftUI

@main
struct IceCreamLocatorApp: App {
    @StateObject private var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            StoreListView()
                .environmentObject(locationManager)
        }
    }
}
