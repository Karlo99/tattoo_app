//
//  CloudTattooScrollView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/24/25.
//

import SwiftUI

struct CloudTattooScrollView: View {
    let cloudTattoos: [DraggableTattoo]
    let leftArmFrame: CGRect
    let rightArmFrame: CGRect
    let onDrop: (DraggableTattoo) -> Void

    let rows = [GridItem(.flexible())]
    let cloudWidth: CGFloat = 350
    let cloudHeight: CGFloat = 150

    var body: some View {
        ZStack {
            Image("transScrollCloud")
                .resizable()
                .scaledToFit()
                .frame(width: cloudWidth, height: cloudHeight)
                .allowsHitTesting(false)

            if #available(iOS 17.0, *) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, spacing: 0) {
                        ForEach(cloudTattoos.indices, id: \.self) { index in
                            let tattoo = cloudTattoos[index]
                            DraggableZoomableRotatableImage(
                                imageName: tattoo.name,
                                leftArmFrame: leftArmFrame,
                                rightArmFrame: rightArmFrame,
                                onDropped: onDrop
                            )
                            .frame(width: 80, height: 80)
                            .shadow(radius: 10, y: 10)
                            .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive, axis: .horizontal) { effect, phase in
                                effect
                                    .scaleEffect(1.5 - abs(phase.value))
                                    .opacity(1.5 - abs(phase.value))
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .safeAreaPadding(.horizontal)
                .padding(.horizontal, 20)
            }
        }
        .frame(width: cloudWidth, height: cloudHeight)
    }
}


#Preview {
    CloudTattooScrollViewPreviewWrapper()
}

struct CloudTattooScrollViewPreviewWrapper: View {
    @State private var dummyDroppedTattoos: [DraggableTattoo] = []
    @State private var leftArmFrame: CGRect = .zero
    @State private var rightArmFrame: CGRect = .zero

    private let sampleTattoos: [DraggableTattoo] = [
        DraggableTattoo(name: "chair"),
        DraggableTattoo(name: "bedBug"),
        DraggableTattoo(name: "cannon"),
        DraggableTattoo(name: "thug")
    ]

    var body: some View {
        CloudTattooScrollView(
            cloudTattoos: sampleTattoos,
            leftArmFrame: leftArmFrame,
            rightArmFrame: rightArmFrame,
            onDrop: { tattoo in
                dummyDroppedTattoos.append(tattoo)
            }
        )
    }
}
