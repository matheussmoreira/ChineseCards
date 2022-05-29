//
//  TopBar.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 18/04/22.
//

import SwiftUI

struct TopBar: View {
    @Binding var page: Int
    var titleNames = [AssetManager.instructionsTitle, AssetManager.lessonOneTitle,
                      AssetManager.lessonTwoTitle, AssetManager.lessonThreeTitle]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.darkRed)
                .frame(height: 75)
            
            HStack {
                // Previous page
                Button(action: { self.page -= 1 }) {
                    NavigateButton(toNextPage: false)
                        .padding()
                }
                
                Spacer()
                
                // Page title
                if page != 0 && page != 5 {
                    Image(titleNames[page-1])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 70)
                }
                
                Spacer()
                
                // Next page
                Button(action: {
                    self.page == 5 ? (self.page = 0) : (self.page += 1)
                }) {
                    NavigateButton(toNextPage: true)
                        .padding()
                }
            }
        }
    }
}

struct NavigateButton: View {
    var toNextPage: Bool
    
    var body: some View {
        if toNextPage {
            Image(AssetManager.navigationNext)
                .resizable()
                .frame(width: 40, height: 40)
        } else {
            Image(AssetManager.navigationPrevious)
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}
