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
    @State private var handPosition = CGPoint(x: 150, y: 110)
    
    @State private var moveDown = true
    @State private var shavedEverything = false
    
    // Timer
    let timer = Timer.publish(every: 0.015, on: .main, in: .common).autoconnect()

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
        //Starting on right jumping to the left
        if handPosition.x > 360 && handPosition.y == 190{
            handPosition.x = 200
            handPosition.y = 320
        }
        
        // Shaving left and exiting to next screen
        if handPosition.x > 200 && handPosition.y > 400{
            handPosition.x = 500
            handPosition.y = 400
            shavedEverything = true
            return
        }
        
        if moveDown {
            handPosition.x += 2
            if handPosition.x > 400 {
                moveDown = false
                handPosition.y += 20
            }
        } else {
            handPosition.x -= 2
            // Hand is going Up
            if handPosition.x < 150 {
                //Hand now goes down
                moveDown = true
                handPosition.y += 20
            }
        }
        
    }
}

//#Preview {
//    RazorView()
//}
