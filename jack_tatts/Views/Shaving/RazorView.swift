//
//  RazorView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 7/7/25.
//

import SwiftUI

struct RazorView: View {
    // Drag motion to razor
    @GestureState private var dragOffset = CGSize.zero
    @State private var handPosition = CGPoint(x: 200, y: 80)
    
    // Hair Patch
    @State private var hairPatches: [HairPatch] = []
    @State private var moveRight = true
    @State private var shavedEverything = false
    
    // Timer
    let timer = Timer.publish(every: 0.005, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            ZStack {
                HairyArmsView(
                    leftArmFrame: .constant(CGRect(x: 0, y: 0, width: 100, height: 100)),
                    rightArmFrame: .constant(CGRect(x: 100, y: 0, width: 100, height: 100))
                )

                Image("shave_hand")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .position(handPosition)
                    .rotationEffect(.degrees(90)) 
            }
            .onReceive(timer) { _ in
                moveRazorAndShave()
            }
            .navigationDestination(isPresented: $shavedEverything) {
                MainView()
                    .navigationBarBackButtonHidden(true)

            }
        }
    }
    
    func moveRazorAndShave() {
        if moveRight {
            handPosition.x += 2
            if handPosition.x > 400 {
                moveRight = false
                handPosition.y += 40
            }
        } else {
            handPosition.x -= 2
            if handPosition.x < 170 {
                moveRight = true
                handPosition.y += 40
            }
        }
        
        if handPosition.x < 50 {
            shavedEverything = true
        }    }
}

#Preview {
    RazorView()
}
