import SwiftUI

struct IceCreamStore: Identifiable {
    let id = UUID()
    let name: String
}

struct StoreListView: View {
    private let stores = [
        IceCreamStore(name: "Happy Ice Cream"),
        IceCreamStore(name: "Baskin-Robbins"),
        IceCreamStore(name: "Frutanas"),
        IceCreamStore(name: "Braum's Ice Cream & Dairy Stores")
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
