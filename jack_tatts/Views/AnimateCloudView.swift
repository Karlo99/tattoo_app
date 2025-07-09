//
//  AnimateCloudView.swift
//  jack_tatts
//
//  Created by carlos monterosa on 7/7/25.
//

import SwiftUI

struct AnimatedCloud: View {
    let imageName: String
    let initialOffset: CGSize
    let maxYOffset: CGFloat
    let size: CGSize

    @State private var yOffset: CGFloat = 0
    @State private var opacity: Double = 2.0

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.width, height: size.height)
            .offset(x: initialOffset.width, y: initialOffset.height + yOffset)
            .opacity(opacity)
            .onAppear {
                startRandomAnimationLoop()
            }
    }

    private func startRandomAnimationLoop() {
        let duration = Double.random(in: 1...20)
        withAnimation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true)) {
            yOffset = CGFloat.random(in: -maxYOffset...maxYOffset)
            opacity = Double.random(in: 0.0...0.01)
        }

        Timer.scheduledTimer(withTimeInterval: duration, repeats: true) { _ in
            withAnimation(Animation.easeInOut(duration: duration)) {
                yOffset = CGFloat.random(in: -maxYOffset...maxYOffset)
                opacity = Double.random(in: 0.0...0.5)
            }
        }
    }
}
