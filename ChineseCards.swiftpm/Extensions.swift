//
//  Extensions.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 20/04/22.
//

import SwiftUI

extension Font {
    static let adaptativeLarge = Font.system(size: UIScreen.main.bounds.width*0.035)
    static let adaptativeMedium = Font.system(size: UIScreen.main.bounds.width*0.025)
    static let adaptative = Font.system(size: UIScreen.main.bounds.width*0.02)
}

extension CGFloat {
    static let standartOffset: CGFloat = UIScreen.main.bounds.width*0.02
    
}
