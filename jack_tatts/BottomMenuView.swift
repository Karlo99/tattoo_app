//
//  BottomMenuView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/25/25.
//

import SwiftUI

struct BottomMenuView: View {
    @Binding var isImageVisible: Bool
    @Binding var imageOffset: CGSize
    @Binding var dragStartPosition: CGSize

    var body: some View {
        VStack(spacing: 16) {
            Text("Drag tattoo up to place it")
                .font(.headline)
                .foregroundColor(.white)

            Image("tattoo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .offset(imageOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            imageOffset = CGSize(
                                width: value.translation.width + dragStartPosition.width,
                                height: value.translation.height + dragStartPosition.height
                            )
                        }
                        .onEnded { _ in
                            dragStartPosition = imageOffset
                            // Optionally hide the menu if dragged high enough
                            if imageOffset.height < -100 {
                                isImageVisible = true
                            }
                        }
                )
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.black.opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    BottomMenuViewPreviewWrapper()
}

struct BottomMenuViewPreviewWrapper: View {
    @State private var imageOffset: CGSize = .zero
    @State private var isImageVisible: Bool = false
    @State private var dragStartPosition: CGSize = .zero

    var body: some View {
        BottomMenuView(
            isImageVisible: $isImageVisible,
            imageOffset: $imageOffset,
            dragStartPosition: $dragStartPosition
        )
    }
}

