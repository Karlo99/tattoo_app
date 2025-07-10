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
    @State private var handPosition = CGPoint(x: 450, y: 290)
    
    // Arm
    @State private var moveRight = true
    @State private var tattooEverything = false
    
    // Timer
    let timer = Timer.publish(every: 0.08, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            
//            ArmsView(
//                leftArmFrame: .constant(CGRect(x: 0, y: 0, width: 100, height: 100)),
//                rightArmFrame: .constant(CGRect(x: 100, y: 0, width: 100, height: 100))
//            )

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
            tattooing()
        }
    }
    
    func tattooing() {
        
        // Starting on right and then jumping to left
        if handPosition.y > 450 {
            tattooEverything = true
            handPosition.x = 200
            handPosition.y = 200
            
        }
        
        // Starting left and finishing the screen
        
//        if handPosition.y > 450 { return }

        
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
        
    }
}

#Preview {
    TattooMachineAnimationView()
}
