import SwiftUI

struct IceCreamStore: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let phone: String
}

struct StoreListView: View {
    private let stores = [
        IceCreamStore(name: "Happy Ice Cream", address: "5025 Church Rd STE 125, Olive Branch, MS 38654", phone: "(662) 370-9848"),
        IceCreamStore(name: "Baskin-Robbins", address: "4805 Bethel Rd, Olive Branch, MS 38654", phone: "(662) 890-9216"),
        IceCreamStore(name: "Frutanas", address: "1609, 9113 MS-178 suite c, Olive Branch, MS 38654", phone: ""),
        IceCreamStore(name: "Braum's Ice Cream & Dairy Stores", address: "6431 Goodman Rd, Olive Branch, MS 38654", phone: "(662) 890-9429")
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
