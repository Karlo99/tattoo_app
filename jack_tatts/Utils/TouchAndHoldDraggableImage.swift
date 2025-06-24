//
//  TouchAndHoldDraggableImage.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/24/25.
//

import Foundation
import SwiftUI

struct TouchAndHoldDraggableImage: View {
    var tattoo: DraggableTattoo
    let onDropped: (DraggableTattoo, CGPoint) -> Void

    @State private var isEditing = false
    @State private var offset: CGSize = .zero
    @GestureState private var dragOffset: CGSize = .zero

    var body: some View {
        Image(tattoo.name)
            .resizable()
            .frame(width: isEditing ? 150 : 80, height: isEditing ? 150 : 80)
            .scaleEffect(isEditing ? 1.2 : 1)
            .shadow(radius: isEditing ? 10 : 0)
            .offset(x: offset.width + dragOffset.width, y: offset.height + dragOffset.height)
            .animation(.easeInOut(duration: 0.2), value: isEditing)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .onEnded { _ in
                        withAnimation {
                            isEditing = true
                        }
                    }
            )
            .simultaneousGesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        if isEditing {
                            state = value.translation
                        }
                    }
                    .onEnded { value in
                        if isEditing {
                            offset.width += value.translation.width
                            offset.height += value.translation.height

                            let dropPoint = CGPoint(x: offset.width + value.location.x, y: offset.height + value.location.y)

                            onDropped(tattoo, dropPoint)

                            withAnimation {
                                isEditing = false
                                offset = .zero
                            }
                        }
                    }
            )
            .onTapGesture {
                // Tap cancels editing mode
                if isEditing {
                    withAnimation {
                        isEditing = false
                        offset = .zero
                    }
                }
            }
    }
}


#Preview {
    TouchAndHoldDraggableImage(
        tattoo: DraggableTattoo(name: "bedBug"),
        onDropped: { _,_  in }
    )
}
