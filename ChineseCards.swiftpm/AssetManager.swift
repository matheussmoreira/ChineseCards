//
//  AssetManager.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 17/04/22.
//

import SwiftUI

// MARK: - Images
struct AssetManager {
    // Common
    static let pattern = "Pattern"
    
    // Navigation
    static let navigationPrevious = "ArrowLeftOrange"
    static let navigationNext = "ArrowRightOrange"
    static let instructionsTitle = "Instructions"
    static let lessonOneTitle = "ElementaryStrokes"
    static let lessonTwoTitle = "BasicStructures"
    static let lessonThreeTitle = "OriginalLooks"
    
    // Welcome
    static let chineseCards = "ChineseCards"
    static let welcomeLandscape = "WelcomeChineseH"
    static let welcomePortrait = "WelcomeChineseV"
    
    // Instructions
    static let leftSideArrows = "Left side arrows"
    static let rightSideArrows = "Right side arrows"
    static let navigateArrows = "Navigate arrows"
    static let moreInfoButton = "More info button"
    static let strokeSelection = "Stroke selection"
    static let allLooksAtOnceIcon = "All looks at once icon"
    
    // Lesson 3
    static let allLooksAtOnce = "allLooks"
    
    // Thank You
    static let thankYouTitle = "ThankYou"
    static let thankYouLandscape = "ThankYouChineseH"
    static let thankYouPortrait = "ThankYouChineseV"
}

// MARK: - Colors & Gradients
extension Color {
    static let darkRed = Color(#colorLiteral(red: 0.3563181758, green: 0.0231459979, blue: 0.07134518772, alpha: 1))
    static let softRed = Color(#colorLiteral(red: 0.7178493142, green: 0.187035352, blue: 0.1971297562, alpha: 1))
    static let softYellow = Color(#colorLiteral(red: 0.9803921580314636, green: 0.929411768913269, blue: 0.6823529601097107, alpha: 1))
    static let darkSoftYellow = Color(#colorLiteral(red: 0.98, green: 0.93, blue: 0.68, alpha: 0.65))
    static let lightOrange = Color(#colorLiteral(red: 1, green: 0.7529411911964417, blue: 0.003921568859368563, alpha: 1))
    static let blackShadow = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25))
    static let blackUnfocusedBackground = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75))
}

extension Gradient {
    private static let redGradient = Gradient(stops: [.init(color: Color(#colorLiteral(red: 0.5882352941, green: 0.1098039216, blue: 0.137254902, alpha: 1)), location: 0), .init(color: Color(#colorLiteral(red: 0.5019607843, green: 0.09803921569, blue: 0.1215686275, alpha: 1)), location: 1)])
    static let redBackground = RadialGradient(gradient: redGradient, center: UnitPoint(x: 0.5, y: 0.5), startRadius: 1, endRadius: 100)
}
