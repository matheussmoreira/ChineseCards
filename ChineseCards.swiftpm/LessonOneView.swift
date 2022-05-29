//
//  LessonOneView.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 17/04/22.
//

import SwiftUI

struct LessonOneView: View {
    @State private var selectedStrokeIdx = 0
    @State private var selectedCharacterIdx = 0
    @State private var zDegrees = 0.0
    @State private var hDegrees = 0.0
    @State private var characterNameCardIsSpinning = false
    @State private var strokeCardIsSpinning = false
    @State private var moreInfo = false
    @State private var correctStrokes = [ChineseStroke]()
    var strokes = ChineseStroke.allCases
    var characters = Characters.ofLessonOne
    
    var selectedCharacter: LessonOneCharacter {
        return characters[selectedCharacterIdx]
    }
    var selectedStroke: ChineseStroke {
        return strokes[selectedStrokeIdx]
    }
    
    var body: some View {
        ZStack {
            Background()
            
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
                
                // Character and Info
                VStack {
                    Button(action:{ withAnimation{ moreInfo.toggle() }}) {
                        YellowInfoSmallCardCollapsed(character: selectedCharacter)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: CardType.whiteBig.cornerRadius)
                            .fill(Color.darkRed)
                            .frame(width: CardType.whiteBig.size.width, height: CardType.whiteBig.size.height)
                        
                        Group {
                            WhiteBigCard(character: selectedCharacter, withDashedCross: true)
                            LessonOneCharacterView(character: selectedCharacter, selectedStrokes: $correctStrokes)
                                .frame(width: CardType.whiteBig.size.width*0.75, height: CardType.whiteBig.size.height*0.75)
                        }.rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                    }
                    
                }.offset(y: -CardType.yellowInfoCollapsedSmall.size.height/2 - 10)
                
                ZStack {
                    // Selected stroke
                    ZStack {
                        RoundedRectangle(cornerRadius: CardType.whiteMedium.cornerRadius)
                            .fill(Color.darkRed)
                            .frame(width: CardType.whiteMedium.size.width, height: CardType.whiteMedium.size.height)
                        
                        Button(action: { withAnimation { selectStroke()} }) {
                            WhiteMediumCard(stroke: selectedStroke)
                        }.rotation3DEffect(.degrees(hDegrees), axis: (x: 0, y: 1, z: 0))
                    }
                    
                    // Arrow
                    Button(action: { selectPreviousStroke() }) {
                        ArrowButtonBW(orientation: .left)
                    }.offset(x: CardType.whiteMedium.size.width/2 + CGFloat.standartOffset, y: -CGFloat.standartOffset)
                    
                    // Arrow
                    Button(action: { selectNextStroke() }) {
                        ArrowButtonBW(orientation: .right)
                    }.offset(x: CardType.whiteMedium.size.width/2 + CGFloat.standartOffset, y: CGFloat.standartOffset)
                }
                
                
            } // HStack
            
            // More info
            if moreInfo {
                Rectangle().foregroundColor(.blackUnfocusedBackground)
                YellowInfoCardExpanded(character: selectedCharacter, moreInfo: $moreInfo)
                    .transition(.scale)
            }
        }
    }
    
}

// MARK: - Action
extension LessonOneView {
    func selectStroke() {
        if selectedCharacter.strokes.contains(where: { $0 == selectedStroke}) {
            if !correctStrokes.contains(where: { $0 == selectedStroke }) {
                correctStrokes.append(selectedStroke)
            }
        }
    }
    
    func selectPreviousStroke() {
        if strokeCardIsSpinning { return }
        strokeCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.hDegrees -= 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedStrokeIdx = (selectedStrokeIdx == 0) ? strokes.count-1 : selectedStrokeIdx-1
            strokeCardIsSpinning = false
        })
    }
    
    func selectNextStroke() {
        if strokeCardIsSpinning { return }
        strokeCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.hDegrees += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedStrokeIdx = (selectedStrokeIdx+1) % strokes.count
            strokeCardIsSpinning = false
        })
    }
    
    func selectPreviousCharacter() {
        if characterNameCardIsSpinning { return }
        characterNameCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.zDegrees -= 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedCharacterIdx = (selectedCharacterIdx == 0) ? characters.count-1 : selectedCharacterIdx-1
            correctStrokes = []
            characterNameCardIsSpinning = false
        })
    }
    
    func selectNextCharacter() {
        if characterNameCardIsSpinning { return }
        characterNameCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.zDegrees += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedCharacterIdx = (selectedCharacterIdx+1) % characters.count
            correctStrokes = []
            characterNameCardIsSpinning = false
        })
    }
}
