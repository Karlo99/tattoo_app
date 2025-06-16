//
//  TattoosView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/16/25.
//

import SwiftUI

struct TattoosView: View {
    @Binding var droppedTattoos: [DraggableTattoo]
    var body: some View {
        
        ForEach(droppedTattoos) { tattoo in
            Image(tattoo.name)
                .resizable()
                .frame(width: 80, height: 80)
                .position(x: tattoo.offset.width, y: tattoo.offset.height)
                .zIndex(1)
        }
    }
}

#Preview {
    TattoosViewPreviewWrapper()
}

struct TattoosViewPreviewWrapper: View {
    @State private var tattoos: [DraggableTattoo] = [
        DraggableTattoo(name: "exampleTattoo", offset: CGSize(width: 150, height: 200))
    ]

    var body: some View {
        TattoosView(droppedTattoos: $tattoos)  // pass the binding here
    }
}
