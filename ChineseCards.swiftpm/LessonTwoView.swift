//
//  LessonTwoView.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 17/04/22.
//

import SwiftUI

struct LessonTwoView: View {
    @State private var structureCardsAreSpinning = false
    @State private var zDegrees = 0.0
    @State private var moreInfo = false
    @State private var selectedStructureIdx = 0
    @State private var selectedRadicalIdx = 0
    @State private var selectedCharacterIdx = 0
    
    private var selectedStructure: [[LessonTwoCharacter]] {
        return characters[selectedStructureIdx]
    }
    private var selectedRadical: [LessonTwoCharacter] {
        return characters[selectedStructureIdx][selectedRadicalIdx]
    }
    private var selectedCharacter: LessonTwoCharacter {
        return characters[selectedStructureIdx][selectedRadicalIdx][selectedCharacterIdx]
    }
    
    var structuresNames = ["1. Single component", "2. Above-below", "3. Left-right", "4. Above-middle-below",
                           "5. Left-middle-right", "6. Surround upper-left", "7. Surround upper-right", "8. Surround lower-left",
                           "9. Surround above", "10. Surround below", "11. Surround left", "12. Surround full", "13. Overlaid"]
    
    var cardTypes: [CardType] = [.whiteBig, .aboveBelow, .leftRight, .aboveMiddleBelow, .leftMiddleRight,
                                 .surroundUpperLeft, .surroundUpperRight, .surroundLowerLeft, .surroundAbove,
                                 .surroundBelow, .surroundLeft, .surrounfFull, .overlaid]
    
    var characters = Characters.ofLessonTwo
    
    var body: some View {
        ZStack {
            Background()
            
            HStack(spacing: CGFloat.standartOffset*3) {
                // Spin button
                HStack(spacing: 2) {
                    Button(action: { selectPreviousStructure() }) {
                        WhiteSmallCard(arrowDown: false)
                    }
                    Button(action: { selectNextStructure() }) {
                        WhiteSmallCard(arrowDown: true)
                    }
                }
                
                // Card
                ZStack {
                    WhiteLabelCard(titleLabel: structuresNames[selectedStructureIdx], cardType: .structureName)
                        .offset(y: -CardType.whiteBig.size.height/2 - CardType.structureName.size.height/2 - CGFloat.standartOffset)
                    
                    switch selectedStructureIdx {
                        case 0, 12: // Single component and overlaid
                            ZStack {
                                RoundedRectangle(cornerRadius: CardType.whiteBig.cornerRadius)
                                    .fill(Color.darkRed)
                                    .frame(width: CardType.whiteBig.size.width, height: CardType.whiteBig.size.height)
                                
                                SingleCharacterSelectionView(selectedRadicalIdx: $selectedRadicalIdx,
                                                             selectedCharacterIdx: $selectedCharacterIdx,
                                                             zDegrees: $zDegrees,
                                                             characters: selectedRadical,
                                                             structure: selectedStructure)
                            }
                            
                            
                            
                        case 1...4: // Left, right, above, below, middle
                            ZStack {
                                RoundedRectangle(cornerRadius: CardType.whiteBig.cornerRadius)
                                    .fill(Color.darkRed)
                                    .frame(width: CardType.whiteBig.size.width, height: CardType.whiteBig.size.height)
                                
                                NonSurroundingCharacterSelectionView(zDegrees: $zDegrees,
                                                                     selectedRadicalIdx: $selectedRadicalIdx,
                                                                     selectedCharacterIdx: $selectedCharacterIdx,
                                                                     characters: selectedRadical,
                                                                     structure: selectedStructure,
                                                                     cardType: cardTypes[selectedStructureIdx])
                                
                            }
                            
                            
                        default: // Surroundings
                            ZStack {
                                RoundedRectangle(cornerRadius: CardType.whiteBig.cornerRadius)
                                    .fill(Color.darkRed)
                                    .frame(width: CardType.whiteBig.size.width, height: CardType.whiteBig.size.height)
                                
                                SurroundingCharacterSelectionView(zDegrees: $zDegrees,
                                                                  selectedRadicalIdx: $selectedRadicalIdx,
                                                                  selectedCharacterIdx: $selectedCharacterIdx,
                                                                  characters: selectedRadical,
                                                                  structure: selectedStructure,
                                                                  cardType: cardTypes[selectedStructureIdx])
                            }
                    }
                }
                        
                // Info
                Button(action:{ withAnimation{ moreInfo.toggle() }}) {
                    YellowInfoMediumCardCollapsed(character: selectedCharacter)
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
    
    func selectPreviousStructure() {
        if structureCardsAreSpinning { return }
        structureCardsAreSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.zDegrees -= 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedStructureIdx = (selectedStructureIdx == 0) ? structuresNames.count-1 : selectedStructureIdx-1
            selectedRadicalIdx = 0
            selectedCharacterIdx = 0
            structureCardsAreSpinning = false
        })
        
    }
    func selectNextStructure() {
        if structureCardsAreSpinning { return }
        structureCardsAreSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.zDegrees += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedStructureIdx = (selectedStructureIdx+1) % structuresNames.count
            selectedRadicalIdx = 0
            selectedCharacterIdx = 0
            structureCardsAreSpinning = false
        })
    }
}


