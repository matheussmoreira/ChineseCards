//
//  InstructionsView.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 24/04/22.
//

import SwiftUI

struct InstructionsView: View {
    let size = UIScreen.main.bounds.width*0.05
    
    var body: some View {
        ZStack {
            Background()
            Rectangle().foregroundColor(.blackUnfocusedBackground).ignoresSafeArea()
            
            VStack {
                Text("Welcome to Chinese Cards!")
                    .font(.adaptativeLarge)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.top)
                
                Text("Here, you'll discover some basic aspects of written Chinese characters.")
                    .font(.adaptative)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Spacer()
                
                Text("This is how the app works:")
                    .font(.adaptativeMedium)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                Group {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(AssetManager.leftSideArrows)
                                    .resizable()
                                    .frame(width: size, height: size)
                                Text("Change the words and basic structures")
                                    .font(.adaptative)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            
                            HStack {
                                Image(AssetManager.moreInfoButton)
                                    .resizable()
                                    .frame(width: size, height: size)
                                Text("Know more info about the word")
                                    .font(.adaptative)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            
                            HStack {
                                Image(AssetManager.allLooksAtOnceIcon)
                                    .resizable()
                                    .frame(width: size, height: size)
                                Text("See all looks at once on Lesson Three")
                                    .font(.adaptative)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                        }.padding(.trailing)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image(AssetManager.rightSideArrows)
                                    .resizable()
                                    .frame(width: size, height: size)
                                Text("Change the strokes, word parts and word looks")
                                    .font(.adaptative)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            
                            HStack {
                                Image(AssetManager.strokeSelection)
                                    .resizable()
                                    .frame(width: size, height: size)
                                Text("Reveal if the stroke is on the word in Lesson One")
                                    .font(.adaptative)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            
                            HStack {
                                Image(AssetManager.navigateArrows)
                                    .resizable()
                                    .frame(width: size, height: size)
                                Text("Navigate between the three lessons")
                                    .font(.adaptative)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                        }.padding(.leading)
                    }
                }
                
                Spacer()
            }.padding(.horizontal)
        }
    }
}
