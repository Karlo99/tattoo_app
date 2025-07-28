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
                    .position(x: geoSize.width / 2 + 100, y: geoSize.height - cloudHeight - 50)

                    .zIndex(5)
                }
            }
            
            // Start Over Button
            Button(action: onStartOver) {
                Image("start_over")
                    .resizable()
                    .frame(width: 300, height: 350)
                    .shadow(radius: 4)
                    .rotationEffect(.degrees(90))
            }
            .frame(width: 200, height: 250)   // constrain the tappable frame
            .contentShape(Rectangle())      // make tappable area match frame exactly
            .position(x: 290, y: geoSize.height - cloudHeight - 50)
        }
        .zIndex(5)
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

