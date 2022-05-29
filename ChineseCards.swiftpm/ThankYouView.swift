//
//  ThankYouView.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 17/04/22.
//

import SwiftUI

struct ThankYouView: View {
    @State private var deviceOrientation = UIDevice.current.orientation
    @Binding var page: Int
    
    var body: some View {
        ZStack {
            Gradient.redBackground
                .ignoresSafeArea()
            
            Image(AssetManager.thankYouLandscape)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            VStack {
                Image("ThankYou")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                Button(action: { page = 2 }) {
                    BlackButton(titleLabel: "Try again")
                }
            }
        }
    }
}
