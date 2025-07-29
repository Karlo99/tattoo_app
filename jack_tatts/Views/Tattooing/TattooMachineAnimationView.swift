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
    @State private var handPosition = CGPoint(x: 400, y: 210)
    
    // Arm
    @State private var moveRight = true
    @State private var isTattooingRight = true
    @State private var isTattooingLeft = false
    
    // Timer
    let timer = Timer.publish(every: 0.08, on: .main, in: .common).autoconnect()
    
    @State private var isTattooing = true
    
    var body: some View {
        ZStack {

            Image("tattoo_machine")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .position(handPosition)
        }
//        VStack {
//            Text("x: \(Int(handPosition.x)), y: \(Int(handPosition.y))")
//                .font(.headline)
//                .foregroundColor(.red)
//                .padding()
//                .background(Color.white.opacity(0.7))
//                .cornerRadius(10)
//                .padding()
//            Spacer()
//        }

        
        .onReceive(timer) { _ in
            if isTattooingRight {
                tattooRightArm()
            } else if isTattooingLeft {
                tattooLeftArm()
            }
        }

    }
    func tattooRightArm() {
        if moveRight {
            handPosition.x -= 20
            if handPosition.x < 400 {
                moveRight = false
                handPosition.y += 20
            }
        } else {
            handPosition.x += 20
            if handPosition.x > 500 {
                moveRight = true
                handPosition.y += 10
            }
        }

        // Transition to left arm
        if handPosition.y > 430 {
            // Reset for left arm
            handPosition = CGPoint(x: 200, y: 200)
            moveRight = true
            isTattooingRight = false
            isTattooingLeft = true
        }
    }
    
    func tattooLeftArm() {

        if handPosition.y >= 440 {
            isTattooingLeft = false
            return
        }

        if moveRight {
            handPosition.x -= 20
            if handPosition.x < 250 {
                moveRight = false
                handPosition.y += 20
            }
        } else {
            handPosition.x += 20
            if handPosition.x > 330 {
                moveRight = true
                handPosition.y += 10
            }
        }
    }



}

#Preview {
    TattooMachineAnimationView()
}
