//
//  CloudShape.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/11/25.
//

import Foundation
import SwiftUI

struct CloudShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.width
        let h = rect.height

        path.move(to: CGPoint(x: 0.1*w, y: 0.5*h))
        path.addCurve(to: CGPoint(x: 0.3*w, y: 0.3*h), control1: CGPoint(x: 0.15*w, y: 0.2*h), control2: CGPoint(x: 0.25*w, y: 0.15*h))
        path.addCurve(to: CGPoint(x: 0.5*w, y: 0.25*h), control1: CGPoint(x: 0.35*w, y: 0.45*h), control2: CGPoint(x: 0.4*w, y: 0.2*h))
        path.addCurve(to: CGPoint(x: 0.7*w, y: 0.3*h), control1: CGPoint(x: 0.6*w, y: 0.3*h), control2: CGPoint(x: 0.65*w, y: 0.15*h))
        path.addCurve(to: CGPoint(x: 0.9*w, y: 0.5*h), control1: CGPoint(x: 0.8*w, y: 0.45*h), control2: CGPoint(x: 0.85*w, y: 0.3*h))
        path.addCurve(to: CGPoint(x: 0.7*w, y: 0.7*h), control1: CGPoint(x: 0.95*w, y: 0.7*h), control2: CGPoint(x: 0.8*w, y: 0.9*h))
        path.addCurve(to: CGPoint(x: 0.5*w, y: 0.75*h), control1: CGPoint(x: 0.6*w, y: 0.6*h), control2: CGPoint(x: 0.55*w, y: 0.8*h))
        path.addCurve(to: CGPoint(x: 0.3*w, y: 0.7*h), control1: CGPoint(x: 0.45*w, y: 0.7*h), control2: CGPoint(x: 0.4*w, y: 0.85*h))
        path.addCurve(to: CGPoint(x: 0.1*w, y: 0.5*h), control1: CGPoint(x: 0.2*w, y: 0.55*h), control2: CGPoint(x: 0.15*w, y: 0.7*h))
        
        path.closeSubpath()
        return path
    }
}
