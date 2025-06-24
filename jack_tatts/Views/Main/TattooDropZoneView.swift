//
//  TattooDropZoneView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/24/25.
//

import SwiftUI

struct TattooDropZoneView: View {
    @Binding var droppedTattoos: [DraggableTattoo]
    @Binding var leftArmFrame: CGRect
    @Binding var rightArmFrame: CGRect

    var body: some View {
        ZStack {
            ForEach(droppedTattoos) { tattoo in
                DraggableZoomableRotatableImage(
                    imageName: tattoo.name,
                    leftArmFrame: leftArmFrame,
                    rightArmFrame: rightArmFrame,
                    onDropped: { updated in
                        if let index = droppedTattoos.firstIndex(where: { $0.id == updated.id }) {
                            droppedTattoos[index] = updated
                        }
                    }
                )
                .offset(tattoo.offset)
                .frame(width: 100, height: 100)
                .zIndex(3)
            }

            ArmsView(leftArmFrame: $leftArmFrame, rightArmFrame: $rightArmFrame)
                .zIndex(2)
        }
        .frame(maxHeight: .infinity)
    }
}


#Preview {
    TattooDropZonePreviewWrapper()
}

struct TattooDropZonePreviewWrapper: View {
    @State private var droppedTattoos: [DraggableTattoo] = [
        DraggableTattoo(name: "bedBug", offset: .zero),
        DraggableTattoo(name: "cannon", offset: CGSize(width: 50, height: 20))
    ]
    @State private var leftArmFrame: CGRect = .zero
    @State private var rightArmFrame: CGRect = .zero

    var body: some View {
        TattooDropZoneView(
            droppedTattoos: $droppedTattoos,
            leftArmFrame: $leftArmFrame,
            rightArmFrame: $rightArmFrame
        )
    }
}
