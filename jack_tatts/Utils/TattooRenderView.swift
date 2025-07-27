//
//  TattooRenderView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 7/26/25.
//

import SwiftUI

struct TattooRenderView: View {
    let droppedTattoos: [DraggableTattoo]

    var body: some View {
        ZStack {
            Image("armBackground")
                .resizable()
                .scaledToFit()

            ForEach(droppedTattoos) { tattoo in
                if let position = tattoo.dropPosition {
                    Image(tattoo.name)
                        .resizable()
                        .frame(width: 60, height: 60) // or tattoo.size if exists
                        .position(position)
                }
            }
        }
        .frame(width: 300, height: 500)
    }
}



//#Preview {
//    TattooRenderView()
//}
