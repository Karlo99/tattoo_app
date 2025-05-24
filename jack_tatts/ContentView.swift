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
            // Background image
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Explanation image
            Image("explanation")
                .resizable()
                .frame(width: 300, height: 500)
                .padding()
            
            // Dim overlay
            Color.black.opacity(0.8).ignoresSafeArea()
            
            // Foreground content
            VStack {
                
                
                
                Text("Tap to Explode")
                    .foregroundColor(.white)
                    .padding()
                
                ParticleExplosionView()
                    .frame(width: 200, height: 200)
            }
        }
    }
}




struct ParticleExplosionView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

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

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            emitter.birthRate = 0
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ShineExampleView()
//        ManualExplodeView()
//        ContentView()
          ContentView()
        
    }
}
