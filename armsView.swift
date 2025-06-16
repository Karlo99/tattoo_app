//
//  ArmsView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/16/25.
//

import SwiftUI

struct ArmsView: View {
    var body: some View {
        HStack(spacing: -150) {
            // Using Geo Reader to be able to know location of the arms
            GeometryReader { geo in
                
                Image("clenched_fist")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .scaleEffect(x: -1, y: 1)
//                                      .onAppear {
//                                          leftArmFrame = geo.frame(in: .global)
//                                      }
//                                      .onChange(of: geo.frame(in: .global)) { newValue in
//                                          leftArmFrame = newValue
//                                      }
            }
            .frame(width: 400, height: 400)
            
            GeometryReader { geo in
                Image("clenched_fist")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
//                                      .onAppear {
//                                          rightArmFrame = geo.frame(in: .global)
//                                      }
//                                      .onChange(of: geo.frame(in: .global)) { newValue in
//                                          rightArmFrame = newValue
//                                      }
                
            }
            .frame(width: 400, height: 400)
            
        }
        .zIndex(0)
    }
}

#Preview {
    ArmsView()
}
