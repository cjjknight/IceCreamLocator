import SwiftUI

struct ArrowView: View {
    let direction: Double

    var body: some View {
        VStack {
            Image(systemName: "arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .rotationEffect(.degrees(direction))
        }
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView(direction: 45)
            .frame(width: 200, height: 200)
    }
}
