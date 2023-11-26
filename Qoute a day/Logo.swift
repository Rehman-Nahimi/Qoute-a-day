//
//  Logo.swift
//  Qoute a day
//
//  Created by Ray Nahimi on 26/11/2023.
//

import SwiftUI

struct Logo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        let startPoint = CGPoint(x: rect.maxX, y: height * 0.93)
        
        path.move(to: startPoint)
        
        path.addLine(to: CGPoint(x: width * 0.63, y: 0.6)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: width * 0.35, y: height * 0.75),
            control: CGPoint(x: width * 0.4, y: height * 0.6)
        )
        path.addQuadCurve(
            to: CGPoint(x: width * 0.28, y: height * 0.62),
            control: CGPoint(x: width * 0.3, y: height * 0.7)
        )
        
        
        
        return path
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
