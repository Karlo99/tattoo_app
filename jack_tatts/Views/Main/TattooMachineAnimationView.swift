//
//  TattooMachineAnimationView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/28/25.
//

import SwiftUI

struct TattooMachineAnimationView: View {
    // Drag motion to razor
    @GestureState private var dragOffset = CGSize.zero
    @State private var handPosition = CGPoint(x: 200, y: 300)
    
    // Hair Patch
    @State private var hairPatches: [HairPatch] = []
    @State private var moveRight = true
    @State private var shavedEverything = false
    
    // Timer
    let timer = Timer.publish(every: 0.015, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {

            Image("tattoo_machine")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .position(handPosition)
        }
        .onReceive(timer) { _ in
            moveRazorAndShave()
        }
    }
    
    func moveRazorAndShave() {
        if handPosition.y > 450 && shavedEverything { return }
        
        if handPosition.y > 450 {
            shavedEverything = true
            handPosition.x = 400
            handPosition.y = 200
            
        }
        
        if moveRight {
            handPosition.x += 2
            if handPosition.x > 300 {
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
        
    }
}

#Preview {
    TattooMachineAnimationView()
}
