import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    @State private var selectedStore: IceCreamStore?

    var body: some View {
        NavigationView {
            if let selectedStore = selectedStore {
                StoreDetailView(selectedStore: $selectedStore)
                    .environmentObject(locationManager)
            } else {
                StoreListView(selectedStore: $selectedStore)
                    .environmentObject(locationManager)
            }
        }
        .onAppear {
            selectedStore = locationManager.closestStore
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LocationManager())
    }
}
