//
//  TattooImageView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/25/25.
//

import SwiftUI

struct TattooImageView: View {
    @Binding var imageOffset: CGSize
    @Binding var dragStartPosition: CGSize
    @Binding var isImageVisible: Bool
    @Binding var isDragging: Bool
    var onDragEnd: () -> Void

    var body: some View {
        Image("tattoo")
            .resizable()
            .scaledToFit()
            .frame(width: 400, height: 400)
            .offset(imageOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        isDragging = true
                        imageOffset = CGSize(
                            width: value.translation.width + dragStartPosition.width,
                            height: value.translation.height + dragStartPosition.height
                        )
                    }
                    .onEnded { _ in
                        dragStartPosition = imageOffset
                        isDragging = false
                        withAnimation(.spring()) {
                            onDragEnd()
                        }
                    }
            )
            .animation(.easeOut(duration: 0.2), value: imageOffset)
    }
}

#Preview {
    TattooImageView(
        imageOffset: .constant(.zero),
        dragStartPosition: .constant(.zero),
        isImageVisible: .constant(true),
        isDragging: .constant(false),
        onDragEnd: {}
    )
}

