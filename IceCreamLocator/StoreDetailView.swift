import SwiftUI

struct StoreDetailView: View {
    let store: IceCreamStore
    
    var body: some View {
        VStack {
            Text("Store: \(store.name)")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: IceCreamStore(name: "Sample Store"))
    }
}
