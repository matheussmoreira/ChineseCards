//
//  ChineseCards.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 20/04/22.
//

import SwiftUI

struct WhiteBigCard: View {
    let cardType = CardType.whiteBig
    var character: Character
    var withDashedCross: Bool = false
    var imageName: String?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .fill(cardType.color)

            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .strokeBorder(.black, lineWidth: 1)
            
            if withDashedCross {
                DashedCross()
            }
            
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: cardType.size.width*0.75, height: cardType.size.height*0.75)
            }
        }
        .compositingGroup()
        .frame(width: cardType.size.width, height: cardType.size.height)
        .shadow(color: .blackShadow, radius: 4, x: 0, y: 4)
    }
}

struct WhiteMediumCard: View {
    var stroke: ChineseStroke?
    var imageName: String?
    let cardType = CardType.whiteMedium
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .fill(cardType.color)

            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .strokeBorder(.black, lineWidth: 1)
            
            if let stroke = stroke {
                Image(stroke.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: cardType.size.width/2, height: cardType.size.height/2)
            }
            
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: cardType.size.width*0.75, height: cardType.size.height*0.75)
            }
            
        }
        .compositingGroup()
        .frame(width: cardType.size.width, height: cardType.size.height)
        .shadow(color: .blackShadow, radius: 4, x: 0, y: 4)
    }
}

struct WhiteSmallCard: View {
    let cardType = CardType.whiteSmall
    var arrowDown: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .fill(cardType.color)

            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .strokeBorder(.black, lineWidth: 1)
            
            Image(systemName: arrowDown ? "arrow.down" : "arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
                .frame(width: cardType.size.width/4, height: cardType.size.height/4)
            
        }
        .compositingGroup()
        .frame(width: cardType.size.width, height: cardType.size.height)
        .shadow(color: .blackShadow, radius: 4, x: 0, y: 4)
    }
}

struct YellowInfoSmallCardCollapsed: View {
    let cardType = CardType.yellowInfoCollapsedSmall
    var character: Character
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .fill(cardType.color)

            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .strokeBorder(.black, lineWidth: 1)
            
            HStack {
                Image(systemName: "info.circle")//.padding()
                Text(character.pinyinWord).font(.adaptative).fontWeight(.medium)
            }.foregroundColor(.black)
            
        }
        .compositingGroup()
        .frame(width: cardType.size.width, height: cardType.size.height)
        .shadow(color: .blackShadow, radius: 4, x: 0, y: 4)
    }
}

struct YellowInfoMediumCardCollapsed: View {
    let cardType = CardType.yellowInfoCollapsedMedium
    var character: Character
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .fill(cardType.color)

            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .strokeBorder(.black, lineWidth: 1)
            
            VStack {
                Image(systemName: "info.circle").padding(.vertical, 5)
                Text(character.pinyinWord).font(.adaptative).fontWeight(.medium)
            }.foregroundColor(.black)
        }
        .compositingGroup()
        .frame(width: cardType.size.width, height: cardType.size.height)
        .shadow(color: .blackShadow, radius: 4, x: 0, y: 4)
    }
}

struct YellowInfoCardExpanded: View {
    let cardType = CardType.yellowInfoExpanded
    var character: Character
    @Binding var moreInfo: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .fill(cardType.color)

            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .strokeBorder(.black, lineWidth: 1)
            
            VStack {
                Text("The character **\(character.chineseWord) (\(character.pinyinWord))** has these related meanings:")
                    .multilineTextAlignment(.center)
                    .font(.adaptative)
                Text("")
                ForEach(character.relatedMeanings, id: \.self ) { relatedMeaning in
                    Text(relatedMeaning)
                        .fontWeight(.light)
                        .font(.adaptative)
                        .multilineTextAlignment(.center)
                }
                
                Button(action: { moreInfo.toggle() }) {
                    BlackButton(titleLabel: "Close")
                }
                
            }.padding()
        }
        .compositingGroup()
        .frame(width: cardType.size.width, height: cardType.size.height)
        .shadow(color: .blackShadow, radius: 4, x: 0, y: 4)
    }
}

struct CharacterLooksDescription: View {
    let cardType = CardType.yellowDescription
    var character: LessonThreeCharacter
    var width: CGFloat {
        if character.description == Characters.jian.description {
            return UIScreen.main.bounds.width*0.9
            
        } else {
            return cardType.size.width
            
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .fill(cardType.color)

            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .strokeBorder(.black, lineWidth: 1)
            
            Text(character.description)
                .font(.adaptative)
        }
        .compositingGroup()
        .frame(width: width, height: cardType.size.height)
        .shadow(color: .blackShadow, radius: 4, x: 0, y: 4)
    }
}

struct RegularPartialCard: View {
    let cardType: CardType
    var surroundingCard: CardType?
    var character: Character
    var imageName: String?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .fill(cardType.color)

            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .strokeBorder(.black, lineWidth: 1)
            
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: getSize().width, height: getSize().height)
            }
            
        }
        .compositingGroup()
        .frame(width: cardType.size.width, height: cardType.size.height)
        .shadow(color: .blackShadow, radius: 4, x: 0, y: 4)
    }
    
    func getSize() -> CGSize {
        switch surroundingCard {
            case .surroundUpperLeft, .surroundUpperRight, .surroundLowerLeft, .surroundLeft, .surrounfFull, .surroundAbove, .surroundBelow:
                return CGSize(width: cardType.size.width*0.95, height: cardType.size.height*0.95)
            default:
                return CGSize(width: cardType.size.width*0.75, height: cardType.size.height*0.75)
        }
    }
}

struct WhiteLabelCard: View {
    let titleLabel: String
    let cardType: CardType
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .fill(cardType.color)
            
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .strokeBorder(.black, lineWidth: 1)
            
            Text(titleLabel)
                .font(.adaptative)
                .bold()
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
        .compositingGroup()
        .frame(width: cardType.size.width, height: cardType.size.height)
        .shadow(color: .blackShadow, radius: 4, x: 0, y: 4)
    }
}

struct AllLooksAtOnceCard: View {
    var cardType = CardType.allLooksAtOnce
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .fill(cardType.color)
            
            RoundedRectangle(cornerRadius: cardType.cornerRadius)
                .strokeBorder(.black, lineWidth: 1)
            
            Image(AssetManager.allLooksAtOnce)
                .resizable()
                .foregroundColor(.black)
                .frame(width: cardType.size.width/2, height: cardType.size.height/2)
        }
        .compositingGroup()
        .frame(width: cardType.size.width, height: cardType.size.height)
        .shadow(color: .blackShadow, radius: 4, x: 0, y: 4)
    }
}
