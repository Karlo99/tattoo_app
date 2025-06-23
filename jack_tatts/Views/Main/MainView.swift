//
//  MainView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/20/25.
//

import SwiftUI

struct MainView: View {
    
    @State private var leftArmFrame: CGRect = .zero
    @State private var rightArmFrame: CGRect = .zero
    
    // Tattoos that have been picked by the user
    @State private var droppedTattoos: [DraggableTattoo] = []
    @State private var cloudTattoos: [DraggableTattoo] = []
    
    
    let rows = [GridItem(.flexible())]
    let cloudHeight: CGFloat = 150
    let cloudWidth: CGFloat = 350

    var body: some View {
        ZStack {
            MainBackgroundView()
            
            VStack(spacing: 0) {
                Spacer()

                ZStack {
                    
                    // Tattoos dropped from cloud
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

                    // Arms below tattoos
                    ArmsView(leftArmFrame: $leftArmFrame, rightArmFrame: $rightArmFrame)
                        .zIndex(2)
                }
                .frame(maxHeight: .infinity)
                
                Spacer()
                    .frame(height: cloudHeight) // Reserve space for cloud at the bottom
            }
            
            VStack {
                Spacer()
                
                ZStack {
                    Image("transScrollCloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width: cloudWidth, height: cloudHeight)
                        .allowsHitTesting(false)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: rows, spacing: 0) {
                            ForEach(cloudTattoos.indices, id: \.self) { index in
                                let tattoo = cloudTattoos[index]
                                DraggableZoomableRotatableImage(
                                    imageName: tattoo.name,
                                    leftArmFrame: leftArmFrame,
                                    rightArmFrame: rightArmFrame,
                                    onDropped: { dropped in
                                        droppedTattoos.append(dropped)
                                    }
                                )
                                .frame(width: 80, height: 80)
                            }
                        }
                        .padding(.horizontal)
                    }
                    // Padding for the tattoo images to look like they are within the cloud
                    .padding(.horizontal, 30)
                    .padding(.vertical, 25)
                }
                .frame(width: cloudWidth, height: cloudHeight)
                
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

