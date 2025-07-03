//
//  TattooMachineAnimationView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/28/25.
//

import SwiftUI

struct TattooMachineAnimationView: View {
    let armOrigin: CGPoint
    let onFinished: () -> Void

    @State private var position: CGPoint?
    @State private var currentIndex: Int = 0
    @State private var trailDots: [CGPoint] = []

    // Generate zig-zag points only based on fixed vertical range
    private var zigZagPoints: [CGPoint] {
        // Define vertical range and step count
        let numberOfSteps = 20
        let stepY: CGFloat = 20

        // Define horizontal bounds for zig-zag
        let leftX = armOrigin.x + 20
        let rightX = armOrigin.x + 120

        var points: [CGPoint] = []
        var yOffset: CGFloat = 0
        var toggle = true

        for _ in 0..<numberOfSteps {
            let x = toggle ? leftX : rightX
            points.append(CGPoint(x: x, y: armOrigin.y + yOffset))
            yOffset += stepY
            toggle.toggle()
        }
        return points
    }

    var body: some View {
        ZStack {
            // Trail dots
            ForEach(trailDots.indices, id: \.self) { i in
                Circle()
                    .fill(Color.black.opacity(0.3))
                    .frame(width: 12, height: 12)
                    .position(trailDots[i])
                    .animation(.easeOut(duration: 0.5), value: trailDots)
            }

            // Tattoo machine image
            if let pos = position {
                Image("tattoo_machine")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .position(pos)
                    .shadow(radius: 5)
            }
        }
        .onAppear {
            startAnimation()
        }
    }

    private func startAnimation() {
        currentIndex = 0
        position = zigZagPoints.first
        moveNext()
    }

    private func moveNext() {
        guard currentIndex < zigZagPoints.count else {
            onFinished()
            return
        }

        if let current = position {
            trailDots.append(current)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                if !trailDots.isEmpty {
                    trailDots.removeFirst()
                }
            }
        }

        withAnimation(.easeInOut(duration: 0.15)) {
            position = zigZagPoints[currentIndex]
        }

        currentIndex += 1

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
            moveNext()
        }
    }
}


#Preview {
    TattooMachineAnimationView(
        armOrigin: CGPoint(x: 50, y: 50),  // example starting point
        onFinished: {
            print("Animation finished in preview")
        }
    )
    .frame(width: 200, height: 400)
    .background(Color.gray.opacity(0.2))
}
