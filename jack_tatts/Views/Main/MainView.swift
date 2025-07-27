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
    @State private var droppedTattoos: [DraggableTattoo] = []
    @State private var cloudTattoos: [DraggableTattoo] = []
    
    // Tattoo Machine
    @State private var showTattooMachineAnimation = false
    
    // Help Sheet
    @State private var showHelpSheet: Bool = false
    
    // Share Button
    @State private var isSharingActive: Bool = false
    @State private var processedImage: Image? = nil
    @State private var shareableImage: ShareableImage? = nil
    
    let cloudHeight: CGFloat = 150
    
    var body: some View {
        GeometryReader { geo in
            
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
                
                Button(action: {
                    if !droppedTattoos.isEmpty {
                        print("✅ GO button tapped. Tattoos dropped: \(droppedTattoos.count)")
                        showTattooMachineAnimation = true
                        captureTattooImage()
                        isSharingActive = true
                    } else {
                        print("❌ GO button tapped but no tattoos dropped.")
                    }
                }) {
                    Image("go")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                
                // Show the animation view only if flagged
                if showTattooMachineAnimation, leftArmFrame != .zero {
                    TattooMachineAnimationView()
                        .zIndex(10)
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
                    
                    if let shareableImage = shareableImage, let preview = processedImage {
                        ShareLink(item: shareableImage, preview: SharePreview("Jack's Tattoo", image: preview))
                    }
                }
                .zIndex(0)
                
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                showHelpSheet = true
                            }) {
                                Image(systemName: "info.circle")
                                    .font(.system(size: 26))
                                    .padding(12)
                                    .foregroundColor(.black)
                                    .background(Image("background"))
                                    .clipShape(.capsule)
                                    .shadow(radius: 2)
                            }
                        }
                        Spacer()
                    }
                        .padding(.top, 10)
                        .padding(.trailing, 20)
                )
                
            }
            
            .onAppear {
                let names = loadTattooNames()
                cloudTattoos = names.map { DraggableTattoo(name: $0) }
            }
            .sheet(isPresented: $showHelpSheet) {
                HelpSheetView()
            }
            
        }
        .offset(x: -120)
    }
    
    func captureTattooImage() {
        let content = TattooRenderView(droppedTattoos: droppedTattoos)
        .frame(width: 300, height: 500)

        let renderer = ImageRenderer(content: content)
        renderer.scale = UIScreen.main.scale

        if let uiImage = renderer.uiImage {
            print("✅ Image rendered for sharing at scale: \(renderer.scale)")
            processedImage = Image(uiImage: uiImage)
            shareableImage = ShareableImage(image: uiImage)
        } else {
            print("❌ Failed to render image.")
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

