//
//  ContentView.swift
//  jack_tatts
//
//  Created by carlos monterosa on 1/10/25.
//

import SwiftUI
import UIKit


struct ContentView: View {
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea() // fills the screen
            Image("explanation")
                            .resizable()
                            .frame(width: 300, height: 500)
                            .padding()

    
        }
        Color.black.opacity(0.8).ignoresSafeArea()
        VStack {
            Text("Tap to Explode")
                .foregroundColor(.white)
                .padding()
                ParticleExplosionView()
                .frame(width: 200, height: 200)
                }
        
        
        
    }
}

//struct ShineExampleView: View {
//    @State private var toggle = false
//
//    var body: some View {
//        VStack(spacing: 20) {
//
//            Text("✨ Shine!")
//                .font(.largeTitle)
//                .padding()
//                .background(Color.yellow)
//                .cornerRadius(12)
//                .changeEffect(Pow.AnyChangeEffect.shine, value: toggle) // 👈 shine effect applied here
//
//            Button("Trigger Shine") {
//                toggle.toggle() // changing the state triggers the shine
//
//
//                print("Toggle value:", toggle)
//            }
//            .padding()
//        }
//    }
//}


struct ParticleExplosionView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: 100, y: 100)
        emitter.emitterShape = .circle
        emitter.emitterSize = CGSize(width: 10, height: 10)

        let cell = CAEmitterCell()
        cell.contents = UIImage(systemName: "star.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal).cgImage
        cell.birthRate = 150
        cell.lifetime = 1.0
        cell.velocity = 150
        cell.velocityRange = 50
        cell.scale = 0.05
        cell.scaleRange = 0.02
        cell.emissionRange = .pi * 2

        emitter.emitterCells = [cell]
        view.layer.addSublayer(emitter)

        // Stop emitting after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            emitter.birthRate = 0
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}


struct ManualExplodeView: View {
    @State private var explode = false
    @State private var trigger = false

    var body: some View {
        ZStack {
            Text("💥")
                .font(.system(size: 60))
                .scaleEffect(trigger ? 1.1 : 1.0)
                .animation(.easeOut(duration: 0.2), value: trigger)

            // Exploding Particles
            ForEach(0..<12, id: \.self) { i in
                Circle()
                    .fill(Color.orange)
                    .frame(width: 10, height: 10)
                    .offset(x: explode ? randomOffset().width : 0,
                            y: explode ? randomOffset().height : 0)
                    .opacity(explode ? 0 : 1)
                    .animation(.easeOut(duration: 0.6), value: explode)
            }
        }
        .onTapGesture {
            trigger.toggle()
            explode = true

            // Reset particles after animation finishes
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                explode = false
            }
        }
    }

    // Generate a random direction for each particle
    func randomOffset() -> CGSize {
        let angle = Double.random(in: 0..<2 * .pi)
        let distance = CGFloat.random(in: 30...80)
        return CGSize(width: cos(angle) * distance, height: sin(angle) * distance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ShineExampleView()
        ManualExplodeView()
//        ContentView()
//
        
    }
}
