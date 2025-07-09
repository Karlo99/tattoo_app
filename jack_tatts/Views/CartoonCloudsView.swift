//
//  CartoonCloudsView.swift
//  jack_tatts
//
//  Created by carlos monterosa on 7/7/25.
//
import SwiftUI

struct CartoonCloudsView: View {
    @State private var currentCloudIndex = 0
    let cloudImages = ["goCloud1", "goCloud2", "goCloud3", "goCloud5","goCloud6","goCloud7","goCloud8","goCloud9","goCloud10", "goCloud11","goCloud12","goCloud13"]

    var body: some View {
        ZStack {
            Image(cloudImages[currentCloudIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 120)
                //.transition(.opacity.combined(with: .scale(scale: 1.5)))
                .id(currentCloudIndex) // Forces view reload for transition
        }
        .animation(.easeInOut(duration: 0.1), value: currentCloudIndex)
        .onAppear {
            startLoopingAnimation()
        }
    }

    func startLoopingAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { _ in
            withAnimation {
                currentCloudIndex = (currentCloudIndex + 1) % cloudImages.count
            }
        }
    }
}
