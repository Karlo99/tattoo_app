//
//  MainView2.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/25/25.
//

import SwiftUI

struct MainView2: View {
    @State private var showMenu = false
    @State private var isBottomMenuVisible = false

    @Binding var imageOffset: CGSize
    @Binding var isImageVisible: Bool

    @State private var dragStartPosition: CGSize = .zero
    @State private var isDraggingTattoo: Bool = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    ZStack {
                        // Arms at the back so tattoos can go on top of them
                        HStack(spacing: -150) {
                            Image("clenched_fist")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 400, height: 400)
                                .scaleEffect(x: -1, y: 1)

                            Image("clenched_fist")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 400, height: 400)
                        }

                        // Tattoo above the fists
                        if isImageVisible {
                            TattooImageView(
                                imageOffset: $imageOffset,
                                dragStartPosition: $dragStartPosition,
                                isImageVisible: $isImageVisible,
                                isDragging: $isDraggingTattoo,
                                onDragEnd: {
                                    if imageOffset.height < -100 {
                                        isImageVisible = true
                                        isBottomMenuVisible = false
                                    }
                                }
                            )
                        }
                    }
                    Spacer()
                }

                // Go Button
                if !showMenu {
                    Button(action: {
                        withAnimation {
                            isBottomMenuVisible.toggle()
                        }
                    }) {
                        Image("go")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 600, height: 600)
                    }
                    .offset(x: -120, y: 60)
                }

                // Bottom menu overlay
//                if isBottomMenuVisible {
//                    VStack {
//                        Spacer()
//                        BottomMenuView()
//                        .transition(.move(edge: .bottom))
//                        .animation(.easeInOut, value: isBottomMenuVisible)
//                    }
//                }
            }

            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("jack_stacks_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                        .offset(y: -60)
                }
            }

            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    MainView2PreviewWrapper()
}

struct MainView2PreviewWrapper: View {
    @State private var offset: CGSize = .zero
    @State private var visible: Bool = false

    var body: some View {
        MainView2(imageOffset: $offset, isImageVisible: $visible)
    }
}

