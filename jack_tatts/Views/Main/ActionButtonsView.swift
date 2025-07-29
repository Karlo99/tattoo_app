//
//  ActionButtonsView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 7/27/25.
//

import SwiftUI

struct ActionButtonsView: View {
    let cloudHeight: CGFloat
    let geoSize: CGSize
    let hasDroppedTattoos: Bool
    let shareableImage: ShareableImage?
    let onStartOver: () -> Void

    var body: some View {
        ZStack {
            if hasDroppedTattoos {
                // Share Button
                if let shareableImage = shareableImage {
                    ShareLink(item: shareableImage, preview: SharePreview("Jack's Tattoo", image: Image("share"))) {
                        Image("share")
                            .resizable()
                            .frame(width: 250, height: 350)
                            .shadow(radius: 4)
                    }
                    .position(x: geoSize.width / 2 + 260, y: geoSize.height - cloudHeight - 50)

                    .zIndex(5)
                }
            }
            
            VStack(spacing: -310) { // vertical stack, spacing controls gap
                Image("start_over")
                    .resizable()
                    .frame(width: 300, height: 350)
                    .rotationEffect(.degrees(90))
                    .shadow(radius: 4)

                Button(action: onStartOver) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 80, height: 80)
                }
                .offset(x: -90)
            }
            .frame(width: 200) // width matches image width to center button properly
            .position(x: 290, y: geoSize.height - cloudHeight - 80)
            .zIndex(5)
        }
    }
}

#Preview {
    ActionButtonsView(
        cloudHeight: 150,
        geoSize: CGSize(width: 400, height: 800),
        hasDroppedTattoos: true,
        shareableImage: nil, // or mock one if you have
        onStartOver: {
            print("Preview: Start Over tapped")
        }
    )
}

