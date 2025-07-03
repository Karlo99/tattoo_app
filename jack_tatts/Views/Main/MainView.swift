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
    @State private var isMachineOn: Bool = false

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
            
            Button(action: {
                if !droppedTattoos.isEmpty {
                    isMachineOn = true
                    print("Tattoo machine started")
                }
            }) {
                Image("go")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            .disabled(isMachineOn)
            .opacity(isMachineOn ? 0.5 : 1.0)

            // Tattoo Machine Animation
            if isMachineOn {
                TattooMachineAnimationView(
                    armOrigin: CGPoint(x: leftArmFrame.minX, y: leftArmFrame.minY),
                    onFinished: {
                        isMachineOn = false
                    }
                )
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

