//
//  LessonThreeView.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 17/04/22.
//

import SwiftUI

struct LessonThreeView: View {
    @State private var selectedDrawingIdx = 0
    @State private var selectedCharacterIdx = 0
    @State private var verticalDegrees = 0.0
    @State private var zDegrees = 0.0
    @State private var horizontalDegrees = 0.0
    @State private var moreInfo = false
    @State private var allLooksAtOnce = false
    @State private var characterIndexCardIsSpinning = false
    @State private var characterCardIsSpinning = false
    var characters = Characters.ofLessonThree
    
    var selectedCharacter: LessonThreeCharacter {
        return characters[selectedCharacterIdx]
    }
    
    var body: some View {
        ZStack {
            Background()
            
            if !allLooksAtOnce {
                HStack(spacing: CGFloat.standartOffset*3) {
                    // Spin button
                    HStack(spacing: 2) {
                        Button(action: { selectPreviousCharacter() }) {
                            WhiteSmallCard(arrowDown: false)
                        }
                        Button(action: { selectNextCharacter() }) {
                            WhiteSmallCard(arrowDown: true)
                        }
                    }
                    
                    // Card
                    ZStack {
                        WhiteLabelCard(titleLabel: "\(selectedDrawingIdx+1)/\(selectedCharacter.drawings.count)", cardType: .drawingIndex)
                            .offset(y: -CardType.whiteBig.size.height/2 - CardType.drawingIndex.size.height/2 - CGFloat.standartOffset/2)
                        
                        RoundedRectangle(cornerRadius: CardType.whiteBig.cornerRadius)
                            .fill(Color.darkRed)
                            .frame(width: CardType.whiteBig.size.width, height: CardType.whiteBig.size.height)
                        
                        WhiteBigCard(character: selectedCharacter, imageName: selectedCharacter.drawings[selectedDrawingIdx])
                            .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                            .rotation3DEffect(.degrees(horizontalDegrees), axis: (x: 0, y: 1, z: 0))
                        
                        Button(action: { selectPreviousDrawing()} ) {
                            ArrowButtonBW(orientation: .left)
                        }.offset(x: -CardType.whiteBig.size.width/2 - CGFloat.standartOffset)
                        
                        Button(action: { selectNextDrawing()} ) {
                            ArrowButtonBW(orientation: .right)
                        }.offset(x: CardType.whiteBig.size.width/2 + CGFloat.standartOffset)
                        
                        Button(action: { withAnimation{ allLooksAtOnce = true }}) {
                            AllLooksAtOnceCard()
                        }.offset(y: CardType.whiteBig.size.height/2 + CardType.allLooksAtOnce.size.height/2 + CGFloat.standartOffset/2)
                        
                    }
                    
                    // Info
                    Button(action:{ withAnimation{ moreInfo.toggle() }}) {
                        YellowInfoMediumCardCollapsed(character: selectedCharacter)
                    }
                }
                
                // More info
                if moreInfo {
                    Rectangle().foregroundColor(.blackUnfocusedBackground)
                    YellowInfoCardExpanded(character: selectedCharacter, moreInfo: $moreInfo)
                        .transition(.scale)
                }
            } else {
                ZStack {
                    Rectangle().foregroundColor(.blackUnfocusedBackground)
                        .transition(.opacity)
                    VStack(spacing: 50) {
                        HStack {
                            ForEach(0..<selectedCharacter.drawings.count, id: \.self) { i in
                                WhiteMediumCard(imageName: selectedCharacter.drawings[i])
                                    .rotationEffect(Angle(degrees: CGFloat(i*5-10)))
                                    .offset(x: CGFloat.standartOffset*CGFloat(i-1))
                            }
                            
                        }
                        
                        CharacterLooksDescription(character: selectedCharacter)
                    }.transition(.scale)
                }
                .onTapGesture(perform: {
                    allLooksAtOnce = false
                })
            }
        }
    }
}

// MARK: - Action
extension LessonThreeView {
    func selectPreviousCharacter() {
        if characterIndexCardIsSpinning { return }
        characterIndexCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.zDegrees -= 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedCharacterIdx = (selectedCharacterIdx == 0) ? characters.count-1 : selectedCharacterIdx-1
            characterIndexCardIsSpinning = false
            selectedDrawingIdx = 0
        })
    }
    
    func selectNextCharacter() {
        if characterIndexCardIsSpinning { return }
        characterIndexCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.zDegrees += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedCharacterIdx = (selectedCharacterIdx+1) % characters.count
            characterIndexCardIsSpinning = false
            selectedDrawingIdx = 0
        })
    }
    
    func selectPreviousDrawing() {
        if characterCardIsSpinning { return }
        characterCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.horizontalDegrees -= 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedDrawingIdx = (selectedDrawingIdx == 0) ? selectedCharacter.drawings.count-1 : selectedDrawingIdx-1
            characterCardIsSpinning = false
        })
    }
    
    func selectNextDrawing() {
        if characterCardIsSpinning { return }
        characterCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.horizontalDegrees += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedDrawingIdx = (selectedDrawingIdx+1) % selectedCharacter.drawings.count
            characterCardIsSpinning = false
        })
    }

}
