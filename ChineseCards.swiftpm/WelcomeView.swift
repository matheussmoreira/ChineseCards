import SwiftUI

struct WelcomeView: View {
    @State private var deviceOrientation = UIDevice.current.orientation
    @Binding var page: Int
    
    var body: some View {
        ZStack {
            Gradient.redBackground
                .ignoresSafeArea()
            
            Image(AssetManager.welcomeLandscape)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            VStack {
                Image(AssetManager.chineseCards)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                Button(action: { page = 1 }) {
                    BlackButton(titleLabel: "Start")
                }
            }
        }
    }
}
