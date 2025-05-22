//
//  SideMenuView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/19/25.
//

import SwiftUI

struct SideMenuView: View {
    //isShowing on whether the sideMenu is showing
    @Binding var isShowing: Bool
    @Binding var imageOffset: CGSize
    @Binding var isImageVisible: Bool
    
    @State private var dragStartPosition: CGSize = .zero
    
//    var images:[String] // or [UIImage]
//
    var body: some View {
        ZStack {
            if isShowing {
                // Gray-out background
                Rectangle()
                    .opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        //Header stating Jack's Stacks
                        SideMenuHeaderView()
                    }
                    .frame(width: 200, alignment: .leading)
                    
                    Spacer()
                }
                // These will be the scroll view of images
                if !isImageVisible {
                    Image("tattoo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .offset(x: imageOffset.width - 80, y: imageOffset.height - 150)
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
                                    
                                    // If dragged past menu width, move to content view
                                    if imageOffset.width >= 200 {
                                        isImageVisible = true
                                        isShowing = false
                                    }
                                }
                        )
                        .animation(.easeInOut, value: imageOffset)
                }
            }
        }
        .animation(.easeInOut, value: isShowing)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)

    }

}

#Preview {
        SideMenuViewPreviewWrapper()
}

struct SideMenuViewPreviewWrapper: View {
        @State private var isShowing = true
        @State private var imageOffset: CGSize = .zero
        @State private var isImageVisible = false

        var body: some View {
            SideMenuView(
                isShowing: $isShowing,
                imageOffset: $imageOffset,
                isImageVisible: $isImageVisible
            )
        }
    }
