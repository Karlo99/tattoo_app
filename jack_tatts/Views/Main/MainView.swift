//
//  MainView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/20/25.
//

import SwiftUI
//Scroll bigger in the center and deminish on the other sidesyou

struct MainView: View {
    @State private var leftArmFrame: CGRect = .zero
    @State private var rightArmFrame: CGRect = .zero
    @State private var droppedTattoos: [DraggableTattoo] = []
    @State private var cloudTattoos: [DraggableTattoo] = []

    let cloudHeight: CGFloat = 150

    var body: some View {
        ZStack {
            MainBackgroundView()

            VStack(spacing: 0) {
                Spacer()

                TattooDropZoneView(
                    droppedTattoos: $droppedTattoos,
                    leftArmFrame: $leftArmFrame,
                    rightArmFrame: $rightArmFrame
                )

                Spacer()
                    .frame(height: cloudHeight)
            }

            VStack {
                Spacer()
                CloudTattooScrollView(
                    cloudTattoos: cloudTattoos,
                    leftArmFrame: leftArmFrame,
                    rightArmFrame: rightArmFrame,
                    onDrop: { tattoo, _ in
                        droppedTattoos.append(tattoo)
                    }
                )
            }
            .zIndex(0)
        }
        .onAppear {
            let names = loadTattooNames()
            cloudTattoos = names.map { DraggableTattoo(name: $0) }
        }
    }
}



#Preview {
    MainViewPreviewWrapper()
}

struct MainViewPreviewWrapper: View {
    var body: some View {
        MainView()
    }
}

