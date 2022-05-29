//
//  UIComponents.swift
//  ChineseCards
//
//  Created by Matheus S. Moreira on 18/04/22.
//

import SwiftUI

struct BlackButton: View {
    let titleLabel: String
    let width: CGFloat = UIScreen.main.bounds.width*0.125
    var height: CGFloat { return width/3 }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.black)
                .frame(width: width, height: height)
            
            Text(titleLabel)
                .font(.adaptative)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}

struct Background: View {
    var body: some View {
        ZStack {
            Gradient.redBackground.ignoresSafeArea()
            Image(AssetManager.pattern)
                .resizable(resizingMode: .tile)
        }.ignoresSafeArea()
    }
}

struct DashedCross: View {
    var lineWidth: CGFloat = 1
    var dashNumber: CGFloat = 5
    
    var body: some View {
        ZStack {
            Line.Vertical()
                .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: [dashNumber]))
                .foregroundColor(.blackShadow)
            Line.Horizontal()
                .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: [dashNumber]))
                .foregroundColor(.blackShadow)
        }
    }
    
    struct Line {
        struct Vertical: Shape {
            func path(in rect: CGRect) -> Path {
                Path { path in
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
                }
            }
        }

        struct Horizontal: Shape {
            func path(in rect: CGRect) -> Path {
                Path { path in
                    path.move(to: CGPoint(x: rect.minX, y: rect.midY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
                }
            }
        }
    }
}

struct ArrowButtonBW: View {
    var orientation: ArrowOrientation
    let width = UIScreen.main.bounds.width*0.04
    
    var body: some View {
        Image(orientation.rawValue)
            .resizable()
            .frame(width: width, height: width)
    }
}

