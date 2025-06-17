//
//  DraggableZoomableRotatableImage.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/14/25.
//

import SwiftUI

struct DraggableZoomableRotatableImage: View {
    let imageName: String
    // Needed to be able to snap the tattoos to the arms
    let leftArmFrame: CGRect
    let rightArmFrame: CGRect
    var onDropped: ((DraggableTattoo)->Void)? = nil
    
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    
    // Zooming in
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    
    //Rotation
    @State private var rotation: Angle = .degrees(0)
    @State private var lastRotation: Angle = .degrees(0)
    
    @State private var allowDrag = false
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .clipped()
            .frame(width: 200, height: 200)
            .offset(offset)
            .scaleEffect(scale)
            .rotationEffect(rotation)
            .gesture(dragGesture.simultaneously(with: magnificationGesture).simultaneously(with: rotationGesture))
        
    }
    
    // Drag gesture
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                offset = CGSize(width: lastOffset.width + value.translation.width,
                                height: lastOffset.height + value.translation.height)
            }
            .onEnded { _ in
                let imageSize: CGFloat = 200 
                let imageCenter = CGPoint(
                    x: offset.width + imageSize / 2,
                    y: offset.height + imageSize / 2
                )

                // Snap logic
//                if leftArmFrame.contains(imageCenter) {
//                    withAnimation(.spring()) {
//                        offset = CGSize(
//                            width: leftArmFrame.midX - imageSize / 2,
//                            height: leftArmFrame.midY - imageSize / 2
//                        )
//                    }
//                } else if rightArmFrame.contains(imageCenter) {
//                    withAnimation(.spring()) {
//                        offset = CGSize(
//                            width: rightArmFrame.midX - imageSize / 2,
//                            height: rightArmFrame.midY - imageSize / 2
//                        )
//                    }
//                }

                lastOffset = offset
                onDropped?(DraggableTattoo(name: imageName, offset: offset))
            }
    }

    // Pinch zoom gesture
    var magnificationGesture: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                scale = lastScale * value
            }
            .onEnded { _ in
                lastScale = scale
            }
    }

    // Rotation gesture
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { value in
                rotation = lastRotation + value
            }
            .onEnded { _ in
                lastRotation = rotation
            }
    }
}

#Preview {
    DraggableZoomableRotatableImage(imageName: "toliet", leftArmFrame: CGRect(x: 100, y: 100, width: 200, height: 200),
                                    rightArmFrame: CGRect(x: 300, y: 100, width: 200, height: 200))
}
