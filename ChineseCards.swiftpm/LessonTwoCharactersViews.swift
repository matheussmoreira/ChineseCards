//
//  LessonTwoCharactersViews.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 20/04/22.
//

import SwiftUI

struct SingleCharacterSelectionView: View {
    @State private var hDegrees = 0.0
    @State private var cardIsSpinning = false
    @Binding var selectedRadicalIdx: Int
    @Binding var selectedCharacterIdx: Int
    @Binding var zDegrees: Double
    var characters: [Character]
    var structure: [[LessonTwoCharacter]]
    
    var characterImageName: String? {
        if let character = characters[selectedCharacterIdx] as? LessonTwoCharacter {
            return character.parts[0]
        }
        return nil
    }
    
    var body: some View {
        ZStack {
            WhiteBigCard(character: characters[selectedCharacterIdx], imageName: characterImageName)
                .rotation3DEffect(.degrees(hDegrees), axis: (x: 0, y: 1, z: 0))
                .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
            
            Button(action: { selectNextCharacter() }) {
                ArrowButtonBW(orientation: .right)
            }.offset(x: CardType.whiteBig.size.width/2 + CGFloat.standartOffset)
        }
        
    }
    
    func selectNextCharacter() {
        if cardIsSpinning { return }
        cardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.hDegrees += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedRadicalIdx = (selectedRadicalIdx+1) % structure.count
            cardIsSpinning = false
        })
        
    }
}

// MARK: - Non Surrounding Structures
struct NonSurroundingCharacterSelectionView: View {
    @State private var radicalCardDegrees: CGFloat = 0.0
    @State private var bodyCardDegrees: CGFloat = 0.0
    @State private var radicalCardIsSpinning = false
    @State private var bodyCardIsSpinning = false
    @Binding var zDegrees: Double
    @Binding var selectedRadicalIdx: Int
    @Binding var selectedCharacterIdx: Int
    var characters: [Character]
    var structure: [[LessonTwoCharacter]]
    var cardType: CardType
    
    var radicalImageName: String {
        return structure[selectedRadicalIdx][selectedCharacterIdx].parts[0]
    }
    
    var bodyImageName: String {
        return structure[selectedRadicalIdx][selectedCharacterIdx].parts[1]
    }
    
    var bodyImageName2: String {
        return structure[selectedRadicalIdx][selectedCharacterIdx].parts[2]
    }
    
    var body: some View {
        
        switch cardType {
            case .aboveBelow:
                VStack(spacing: 2) {
                    ZStack {
                        Button(action: { selectNextRadical() }) {
                            ArrowButtonBW(orientation: .down)
                        }.offset(x: CardType.aboveBelow.size.width/2 + CGFloat.standartOffset)
                        RegularPartialCard(cardType: .aboveBelow, character: characters[selectedCharacterIdx], imageName: radicalImageName)
                            .rotation3DEffect(.degrees(radicalCardDegrees), axis: (x: -1, y: 0, z: 0))
                            .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                    }
                    
                    ZStack {
                        Button(action: { selectNextBody() }) {
                            ArrowButtonBW(orientation: .down)
                        }.offset(x: CardType.aboveBelow.size.width/2 + CGFloat.standartOffset)
                        RegularPartialCard(cardType: .aboveBelow, character: characters[selectedCharacterIdx], imageName: bodyImageName)
                            .rotation3DEffect(.degrees(bodyCardDegrees), axis: (x: -1, y: 0, z: 0))
                            .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                    }
                }
            case .leftRight:
                HStack(spacing: 2) {
                    ZStack {
                        Button(action: { selectNextRadical() }) {
                            ArrowButtonBW(orientation: .right)
                        }.offset(x: -CardType.leftRight.size.width/2 - CGFloat.standartOffset)
                        RegularPartialCard(cardType: .leftRight, character: characters[selectedCharacterIdx], imageName: radicalImageName)
                            .rotation3DEffect(.degrees(radicalCardDegrees), axis: (x: 0, y: 1, z: 0))
                            .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                    }
                    
                    ZStack {
                        Button(action: { selectNextBody() }) {
                            ArrowButtonBW(orientation: .right)
                        }.offset(x: CardType.leftRight.size.width/2 + CGFloat.standartOffset)
                        RegularPartialCard(cardType: .leftRight, character: characters[selectedCharacterIdx], imageName: bodyImageName)
                            .rotation3DEffect(.degrees(bodyCardDegrees), axis: (x: 0, y: 1, z: 0))
                            .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                    }
                }
            case .aboveMiddleBelow:
                VStack(spacing: 2) {
                    ZStack {
                        Button(action: { selectNextRadical() }) {
                            ArrowButtonBW(orientation: .down)
                        }.offset(x: CardType.aboveBelow.size.width/2 + CGFloat.standartOffset)
                        RegularPartialCard(cardType: .aboveMiddleBelow, character: characters[selectedCharacterIdx], imageName: radicalImageName)
                            .rotation3DEffect(.degrees(radicalCardDegrees), axis: (x: -1, y: 0, z: 0))
                            .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                    }
                    
                    RegularPartialCard(cardType: .aboveMiddleBelow, character: characters[selectedCharacterIdx], imageName: bodyImageName)
                        .rotation3DEffect(.degrees(bodyCardDegrees), axis: (x: -1, y: 0, z: 0))
                        .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                    
                    RegularPartialCard(cardType: .aboveMiddleBelow, character: characters[selectedCharacterIdx], imageName: bodyImageName2)
                        .rotation3DEffect(.degrees(bodyCardDegrees), axis: (x: -1, y: 0, z: 0))
                        .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                }
            case .leftMiddleRight:
                HStack(spacing: 2) {
                    ZStack {
                        Button(action: { selectNextRadical() }) {
                            ArrowButtonBW(orientation: .right)
                        }.offset(x: -CardType.leftMiddleRight.size.width/2 - CGFloat.standartOffset)
                        RegularPartialCard(cardType: .leftMiddleRight, character: characters[selectedCharacterIdx], imageName: radicalImageName)
                            .rotation3DEffect(.degrees(radicalCardDegrees), axis: (x: 0, y: 1, z: 0))
                            .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                    }
                    
                    RegularPartialCard(cardType: .leftMiddleRight, character: characters[selectedCharacterIdx], imageName: bodyImageName)
                        .rotation3DEffect(.degrees(bodyCardDegrees), axis: (x: 0, y: 1, z: 0))
                        .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                    
                    ZStack {
                        Button(action: { selectNextBody() }) {
                            ArrowButtonBW(orientation: .right)
                        }.offset(x: CardType.leftMiddleRight.size.width/2 + CGFloat.standartOffset)
                        RegularPartialCard(cardType: .leftMiddleRight, character: characters[selectedCharacterIdx], imageName: bodyImageName2)
                            .rotation3DEffect(.degrees(bodyCardDegrees), axis: (x: 0, y: 1, z: 0))
                            .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                    }
                }
            default:
                Spacer()
        }
        
    }
    
    func selectNextRadical() {
        if radicalCardIsSpinning || bodyCardIsSpinning { return }
        radicalCardIsSpinning = true; bodyCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.radicalCardDegrees += 360
            self.bodyCardDegrees += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedRadicalIdx = (selectedRadicalIdx+1) % structure.count
            selectedCharacterIdx = 0
            radicalCardIsSpinning = false; bodyCardIsSpinning = false
        })
    }
    
    func selectNextBody() {
        if bodyCardIsSpinning { return }
        bodyCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.bodyCardDegrees += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedCharacterIdx = (selectedCharacterIdx+1) % characters.count
            bodyCardIsSpinning = false
        })
    }
}

// MARK: - Surrounding Structures
struct SurroundingCharacterSelectionView: View {
    @State private var innerCardXOffset: CGFloat = 0.0
    @State private var innerCardYOffset: CGFloat = 0.0
    @State private var upperArrowButtonXOffset: CGFloat = 0.0
    @State private var upperArrowButtonYOffset: CGFloat = 0.0
    @State private var lowerArrowButtonXOffset: CGFloat = 0.0
    @State private var lowerArrowButtonYOffset: CGFloat = 0.0
    
    @State private var radicalCardDegrees: CGFloat = 0.0
    @State private var bodyCardDegrees: CGFloat = 0.0
    @State private var radicalCardIsSpinning = false
    @State private var bodyCardIsSpinning = false
    @Binding var zDegrees: Double
    @Binding var selectedRadicalIdx: Int
    @Binding var selectedCharacterIdx: Int
    
    var characters: [Character]
    var structure: [[LessonTwoCharacter]]
    var cardType: CardType
    
    var radicalImageName: String {
        return structure[selectedRadicalIdx][selectedCharacterIdx].parts[0]
    }
    
    var bodyImageName: String {
        return structure[selectedRadicalIdx][selectedCharacterIdx].parts[1]
    }
    
    var body: some View {
        switch cardType {
            case .surroundUpperLeft:
                overlappingCards(surrounding: cardType)
            case .surroundUpperRight:
                overlappingCards(surrounding: cardType)
            case .surroundLowerLeft:
                overlappingCards(surrounding: cardType)
            case .surroundAbove:
                overlappingCards(surrounding: cardType)
            case .surroundBelow:
                overlappingCards(surrounding: cardType)
            case .surroundLeft:
                overlappingCards(surrounding: cardType)
            case .surrounfFull:
                overlappingCards(surrounding: cardType)
            default:
                Spacer()
        }
        
    }
    
    func overlappingCards(surrounding: CardType) -> some View {
        ZStack {
            RegularPartialCard(cardType: .whiteBig, surroundingCard: surrounding, character: characters[selectedCharacterIdx], imageName: radicalImageName)
                .rotation3DEffect(.degrees(radicalCardDegrees), axis: (x: 0, y: 1, z: 0))
                .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
            
            Image(bodyImageName)
                .resizable()
                .frame(width: CardType.whiteBig.size.width, height: CardType.whiteBig.size.height)
                .rotation3DEffect(.degrees(bodyCardDegrees), axis: (x: 0, y: 1, z: 0))
                .rotation3DEffect(.degrees(zDegrees), axis: (x: 0, y: 0, z: 1))
                .offset(x: innerCardXOffset, y: innerCardYOffset)
            
            Button(action: { selectNextRadical() }) {
                ArrowButtonBW(orientation: .right)
            }.offset(x: upperArrowButtonXOffset, y: upperArrowButtonYOffset)
            
            Button(action: { selectNextBody() }) {
                ArrowButtonBW(orientation: .right)
            }.offset(x: lowerArrowButtonXOffset, y: lowerArrowButtonYOffset)
        }.onAppear {
            calculateOffset(selectedCardType: cardType)
        }
    }
    
    func calculateOffset(selectedCardType: CardType) {
        let widthDifference = CardType.whiteBig.size.width-cardType.size.width
        let heightDifference = CardType.whiteBig.size.height-cardType.size.height
        
        upperArrowButtonXOffset = CardType.whiteBig.size.width/2 + CGFloat.standartOffset
        upperArrowButtonYOffset = -CardType.whiteBig.size.height/2 + CGFloat.standartOffset
        lowerArrowButtonXOffset = CardType.whiteBig.size.width/2 + CGFloat.standartOffset
        lowerArrowButtonYOffset = upperArrowButtonYOffset+heightDifference/2

        switch selectedCardType {
            case .surroundUpperLeft:
                innerCardXOffset = widthDifference/2
                innerCardYOffset = heightDifference/2
            case .surroundUpperRight:
                innerCardXOffset = -widthDifference/2
                innerCardYOffset = heightDifference/2
            case .surroundLowerLeft:
                innerCardXOffset = widthDifference/2
                innerCardYOffset = -heightDifference/2
            case .surroundAbove:
                innerCardXOffset = 0
                innerCardYOffset = heightDifference/2
            case .surroundBelow:
                innerCardXOffset = 0
                innerCardYOffset = -heightDifference/2
            case .surroundLeft:
                innerCardXOffset = widthDifference/2
                innerCardYOffset = 0
            case .surrounfFull:
                innerCardXOffset = 0
                innerCardYOffset = 0
            default:
                break
        }
    }
    
    func selectNextRadical() {
        if radicalCardIsSpinning || bodyCardIsSpinning { return }
        radicalCardIsSpinning = true; bodyCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.radicalCardDegrees += 360
            self.bodyCardDegrees += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedRadicalIdx = (selectedRadicalIdx+1) % structure.count
            selectedCharacterIdx = 0
            radicalCardIsSpinning = false; bodyCardIsSpinning = false
        })
    }
    
    func selectNextBody() {
        if bodyCardIsSpinning { return }
        bodyCardIsSpinning = true
        
        withAnimation(.easeIn(duration: 0.4)) {
            self.bodyCardDegrees += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            selectedCharacterIdx = (selectedCharacterIdx+1) % characters.count
            bodyCardIsSpinning = false
        })
    }
    
}
