//
//  LessonOneCharacterView.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 23/04/22.
//

import SwiftUI

struct LessonOneCharacterView: View {
    var character: LessonOneCharacter
    @Binding var selectedStrokes: [ChineseStroke]
  
    var body: some View {
        ZStack {
            ForEach(character.strokes, id: \.self) { stroke in
                getGrayStroke(stroke)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
            }
            
            ForEach(selectedStrokes, id: \.self) { stroke in
                getBlackStroke(stroke)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .transition(.opacity)
            }
        }
    }
    
    private func getGrayStroke(_ stroke: ChineseStroke) -> Image {
        return Image("\(character.pinyinWord) \(stroke.rawValue) gray")
    }
    
    private func getBlackStroke(_ stroke: ChineseStroke) -> Image {
        return Image("\(character.pinyinWord) \(stroke.rawValue) black")
    }

}
