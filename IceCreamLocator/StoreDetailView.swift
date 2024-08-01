import SwiftUI


struct StoreDetailView: View {
    let store: IceCreamStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(store.name)")
                .font(.title)
            Text("Address: \(store.address)")
            Text("Phone: \(store.phone)")
            Spacer()
        }
        .padding()
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: IceCreamStore(name: "Sample Store", address: "123 Main St", phone: "555-555-5555"))
    }
}
