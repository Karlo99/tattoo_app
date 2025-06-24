//
//  DraggableZoomableRotatableImage.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/14/25.
//

import SwiftUI

struct DraggableZoomableRotatableImage: View {
    let imageName: String
    // Where the image is dropped
    let leftArmFrame: CGRect
    let rightArmFrame: CGRect
    var onDropped: ((DraggableTattoo)->Void)? = nil
    
    @State private var currentOffset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    @State private var dragOffset: CGSize = .zero
    
    // Zooming in
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    
    //Rotation
    @State private var rotation: Angle = .degrees(0)
    @State private var lastRotation: Angle = .degrees(0)
    @GestureState private var gestureRotation: Angle = .zero
    
    // Dragging when double tap
    @State private var isDragging = false

    
    @State private var allowDrag = false
    
    var body: some View {
        GeometryReader { geo in
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipped()
                // Size that the images appear as
                .frame(width: 150, height: 150)
                .scaleEffect(scale)
                .rotationEffect(lastRotation + gestureRotation)
                .offset(currentOffset)
                .contentShape(Rectangle())
                // Removed the tap gesture here
                .gesture(dragGesture(in: geo))   // Always active drag gesture
                .simultaneousGesture(magnificationGesture)
                .simultaneousGesture(rotationGesture)
                .frame(width: 200, height: 200)
        }
        .frame(width: 200, height: 200)
    }
    
    // Drag Gesture
    func dragGesture(in geo: GeometryProxy) -> some Gesture {
        DragGesture()
            .onChanged { value in
                currentOffset = CGSize(
                    width: dragOffset.width + value.translation.width,
                    height: dragOffset.height + value.translation.height
                )
            }
            .onEnded { value in
                dragOffset = currentOffset
                
                // Identifying which arm it was dragged to
                let globalLocation = geo.frame(in: .global).origin.x
                let screenWidth = UIScreen.main.bounds.width
                let isLeft = globalLocation < screenWidth / 2
                
                // Placing the image onto correct arm
                let adjustedOffset = CGSize(width: isLeft ? -100: 100, height: 50)
                
                onDropped?(DraggableTattoo(name: imageName, offset: adjustedOffset))
            }
    }
    
    // Magnification Gesture
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
            .updating($gestureRotation) { value, state, _ in
                state = value
            }
            .onEnded { value in
                lastRotation += value
            }
    }

}

#Preview {
    DraggableZoomableRotatableImage(imageName: "bedBug", leftArmFrame: CGRect(x: 100, y: 100, width: 200, height: 200),
                                    rightArmFrame: CGRect(x: 300, y: 100, width: 200, height: 200))
}
