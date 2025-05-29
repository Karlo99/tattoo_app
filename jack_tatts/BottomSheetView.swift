//
//  BottomSheetView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/25/25.
//

import SwiftUI

struct BottomSheetView: View {
    @Binding var isShowing: Bool
    @Binding var imageOffset: CGSize
    @Binding var dragStartPosition: CGSize
    @Binding var isImageVisible: Bool
    
    //var images:[String] // or [UIImage]
    
    
    var body: some View {
        HStack {
            if !isImageVisible {
                
                Image("tattoo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
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
                                
                                // If dragged past menu height, move to content view
                                if imageOffset.height <= -100{
                                    isImageVisible = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        isShowing = false
                                    }
                                }
                            }
                    )
                    .animation(.easeInOut, value: imageOffset)
            }
        }
        .background(
            Image("background")
                .ignoresSafeArea()
        )
    }
    
}
#Preview {
    BottomSheetViewPreviewWrapper()
}


struct BottomSheetViewPreviewWrapper: View {
        @State private var isShowing = true
        @State private var imageOffset: CGSize = .zero
        @State private var isImageVisible = false
        @State private var dragStartPosition: CGSize = .zero

        var body: some View {
            BottomSheetView(
                isShowing: $isShowing,
                imageOffset: $imageOffset,
                dragStartPosition: $dragStartPosition,
                isImageVisible: $isImageVisible
            )
        }
    }
