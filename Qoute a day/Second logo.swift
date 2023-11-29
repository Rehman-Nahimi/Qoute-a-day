//
//  Second logo.swift
//  Qoute a day
//
//  Created by Ray Nahimi on 28/11/2023.
//

import SwiftUI

struct SwiftLogo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        let startPoint = CGPoint(x: rect.minX, y: height * 0.63)
        
        path.move(to: startPoint)
        path.addCurve(
            to: CGPoint(x: width * 0.98, y: height * 0.98),
            control1: CGPoint(x: width * 0.5, y: height * 1.35),
            control2: CGPoint(x: width * 0.85, y: height * 0.67)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: width * 0.9, y: height * 0.7),
            control: CGPoint(x: width * 1.0, y: height * 0.85)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: width * 0.61, y: rect.minY),
            control: CGPoint(x: width * 1.0, y: height * 0.3)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: width * 0.7, y: height * 0.53),
            control: CGPoint(x: width * 0.78, y: height * 0.3)
        )
        
        
        path.addQuadCurve(
            to: CGPoint(x: width * 0.215, y: height * 0.09),
            control: CGPoint(x: width * 0.35, y: height * 0.25)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: width * 0.5, y: height * 0.48),
            control: CGPoint(x: width * 0.3, y: height * 0.25)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: width * 0.1, y: height * 0.15),
            control: CGPoint(x: width * 0.35, y: height * 0.4)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: width * 0.56, y: height * 0.71),
            control: CGPoint(x: width * 0.33, y: height * 0.51)
        )
        
        path.addQuadCurve(
            to: startPoint,
            control: CGPoint(x: width * 0.3, y: height * 0.85)
        )
        
        return path
    }
}


struct SwiftLogo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .fill(
                    LinearGradient(
                        colors: [
                            .lightBackground,
                            .fontBrown
                        ],
                        startPoint: .bottomTrailing,
                        endPoint: .topLeading
                    )
                )
            SwiftLogo()
                .fill(.white)
                .padding(25)
        }
        .padding(50)
        .aspectRatio(1, contentMode: .fit)
    }
}