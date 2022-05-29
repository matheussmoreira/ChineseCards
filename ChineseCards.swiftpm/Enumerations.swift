//
//  Enumerations.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 18/04/22.
//

import SwiftUI

enum ChineseStroke: String, CaseIterable {
    case heng = "heng"
    case shu = "shu"
    case pie = "pie"
    case dian = "dian"
    case na = "na"
    case hengzhe = "hengzhe"
    case shuzhe = "shuzhe"
    case shugou = "shugou"
    case hengzhegou = "hengzhegou"
    case wogou = "wogou"
}

enum ArrowOrientation: String {
    case left = "ArrowLeftWhite"
    case right = "ArrowRightWhite"
    case up = "ArrowUpWhite"
    case down = "ArrowDownWhite"
}

enum CardType {
    // Cases
    case whiteBig
    case whiteMedium
    case whiteSmall
    case yellowInfoExpanded
    case yellowInfoCollapsedMedium
    case yellowInfoCollapsedSmall
    case yellowDescription
    case structureName
    case drawingIndex
    case allLooksAtOnce
    case aboveBelow
    case leftRight
    case aboveMiddleBelow
    case leftMiddleRight
    case surroundUpperLeft
    case surroundUpperRight
    case surroundLowerLeft
    case surroundAbove
    case surroundBelow
    case surroundLeft
    case surrounfFull
    case overlaid
    
    // Properties
    var cornerRadius: CGFloat {
        switch self {
            case .yellowInfoCollapsedSmall, .yellowDescription, .structureName, .drawingIndex, .allLooksAtOnce:
                return 5
            case .whiteSmall, .yellowInfoCollapsedMedium:
                return 10
            default:
                return 20
        }
    }
    
    var color: Color {
        switch self {
            case .yellowInfoExpanded, .yellowInfoCollapsedMedium, .yellowInfoCollapsedSmall, .yellowDescription:
                return .softYellow
            default:
                return .white
        }
    }
    
    var size: CGSize {
        let standartWidth = UIScreen.main.bounds.width*0.25
        
        switch self {
            case .whiteBig:
                return CGSize(width: standartWidth, height: standartWidth)
                
            case .whiteMedium:
                let width = UIScreen.main.bounds.width*0.19
                return CGSize(width: width, height: width)
                
            case .whiteSmall:
                let width = UIScreen.main.bounds.width*0.05
                let height = UIScreen.main.bounds.width*0.1
                return CGSize(width: width, height: height)
                
            case .yellowInfoCollapsedMedium:
                let width = UIScreen.main.bounds.width*0.1
                let height = UIScreen.main.bounds.width*0.153
                return CGSize(width: width, height: height)
                
            case .yellowInfoExpanded:
                let width = UIScreen.main.bounds.width*0.5
                let height = UIScreen.main.bounds.width*0.3
                return CGSize(width: width, height: height)
                
            case .yellowInfoCollapsedSmall:
                let width = UIScreen.main.bounds.width*0.209
                let height = UIScreen.main.bounds.width*0.039
                return CGSize(width: width, height: height)
                
            case .yellowDescription:
                let width = UIScreen.main.bounds.width*0.75
                let height = UIScreen.main.bounds.width*0.039
                return CGSize(width: width, height: height)
                
            case .structureName:
                let width = UIScreen.main.bounds.width*0.255
                let height = UIScreen.main.bounds.width*0.039
                return CGSize(width: width, height: height)
                
            case .drawingIndex:
                let width = UIScreen.main.bounds.width*0.105
                let height = UIScreen.main.bounds.width*0.039
                return CGSize(width: width, height: height)
                
            case .allLooksAtOnce:
                let width = UIScreen.main.bounds.width*0.071
                let height = UIScreen.main.bounds.width*0.039
                return CGSize(width: width, height: height)
                
            case .leftRight:
                return CGSize(width: standartWidth/2, height: standartWidth)
                
            case .aboveBelow:
                return CGSize(width: standartWidth, height: standartWidth/2)
                
            case .leftMiddleRight:
                return CGSize(width: standartWidth/3, height: standartWidth)
                
            case .aboveMiddleBelow:
                return CGSize(width: standartWidth, height: standartWidth/3)
                
            default: // Surroundings
                return CGSize(width: standartWidth*0.75, height: standartWidth*0.75)
        }
    }
}


