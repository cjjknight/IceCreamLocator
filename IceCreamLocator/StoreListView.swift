import SwiftUI

struct IceCreamStore: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let phone: String
    let latitude: Double
    let longitude: Double
}

struct StoreListView: View {
    @EnvironmentObject var locationManager: LocationManager
    @Binding var selectedStore: IceCreamStore?

    var body: some View {
        NavigationView {
            List(locationManager.stores) { store in
                Button(action: {
                    selectedStore = store
                }) {
                    Text(store.name)
                }
            }
            .navigationTitle("Select Store")
            .navigationBarItems(leading: Button("Close") {
                selectedStore = locationManager.closestStore
            })
        }
    }
}

struct StoreListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListView(selectedStore: .constant(nil)).environmentObject(LocationManager())
    }
}
