//
//  HairyArmsView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 7/7/25.
//

import SwiftUI

struct HairyArmsView: View {
    @Binding var leftArmFrame: CGRect
    @Binding var rightArmFrame: CGRect
    
    

    var body: some View {
        HStack(spacing: -150) {
            GeometryReader { geo in
                Image("arm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .scaleEffect(x: -1, y: 1)
                    .onAppear {
                        DispatchQueue.main.async {
                            leftArmFrame = geo.frame(in: .global)
                        }
                    }
            }
            .frame(width: 350, height: 400)

            GeometryReader { geo in
                Image("arm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .scaleEffect(x: 1, y: 1)
                    .onAppear {
                        DispatchQueue.main.async {
                            rightArmFrame = geo.frame(in: .global)
                        }
                    }
            }
            .frame(width: 400, height: 400)
        }
    }
}


#Preview {
    HairyArmsView(
        leftArmFrame: .constant(CGRect(x: 0, y: 0, width: 100, height: 100)),
        rightArmFrame: .constant(CGRect(x: 100, y: 0, width: 100, height: 100))
    )
}
