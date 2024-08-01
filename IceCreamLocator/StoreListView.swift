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
    private let stores = [
        IceCreamStore(name: "Happy Ice Cream", address: "5025 Church Rd STE 125, Olive Branch, MS 38654", phone: "(662) 370-9848", latitude: 34.9614, longitude: -89.8295),
        IceCreamStore(name: "Baskin-Robbins", address: "4805 Bethel Rd, Olive Branch, MS 38654", phone: "(662) 890-9216", latitude: 34.9638, longitude: -89.8387),
        IceCreamStore(name: "Frutanas", address: "1609, 9113 MS-178 suite c, Olive Branch, MS 38654", phone: "", latitude: 34.9650, longitude: -89.8353),
        IceCreamStore(name: "Braum's Ice Cream & Dairy Stores", address: "6431 Goodman Rd, Olive Branch, MS 38654", phone: "(662) 890-9429", latitude: 34.9620, longitude: -89.8252),
        IceCreamStore(name: "Scooters Coffee", address: "Cockrum and College Street, Olive Branch, MS", phone: "(555) 555-5555", latitude: 34.9543, longitude: -89.8302)
]
    
    var body: some View {
        NavigationView {
            List(stores) { store in
                NavigationLink(destination: StoreDetailView(store: store)) {
                    Text(store.name)
                }
            }
            .navigationTitle("Ice Cream Stores")
        }
    }
}

struct StoreListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListView()
    }
}
