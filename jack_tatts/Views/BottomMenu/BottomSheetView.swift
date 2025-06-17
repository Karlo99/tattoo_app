//
//  BottomSheetView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/25/25.
//

import SwiftUI

struct BottomSheetView: View {
    // Image Loading
    @State private var tattoos: [DraggableTattoo] = []
    var onTattooDragged: ((DraggableTattoo) -> Void)? = nil // <-- Add this
    
    let rows = [GridItem(.flexible())]
    let cloudWidth: CGFloat = 350
    let cloudHeight: CGFloat = 150
    let leftArmFrame: CGRect
    let rightArmFrame: CGRect
    
    @State private var activeTattoos: [DraggableTattoo] = []
    
    var body: some View {
            ZStack {

                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHGrid(rows: rows, spacing: 0) {
                        ForEach(tattoos.indices, id: \.self) { index in
                            let tattoo = tattoos[index]
                            
                            DraggableZoomableRotatableImage(imageName: tattoo.name, leftArmFrame: leftArmFrame, rightArmFrame: rightArmFrame, onDropped: { droppedTatoo in onTattooDragged?(droppedTatoo)})
                            // This frame controls the width between each design
                                .frame(width: 90, height: 90)
                        }
                    }
                    .padding(.horizontal)
                }
                // Designs stay within the cloud boundaries
                .frame(width: cloudWidth - 50)
                
                Image("transScrollCloud")
                    .resizable()
                    .scaledToFit()
                    .frame(width: cloudWidth, height: cloudHeight)
                    .allowsHitTesting(false)
                
            }
    
                    
            .onAppear(){
                let names = loadTattooNames()
                tattoos = names.map { DraggableTattoo(name: $0) }
            }

    }
}


#Preview {
    BottomSheetViewPreviewWrapper()
}


struct BottomSheetViewPreviewWrapper: View {

        var body: some View {
            BottomSheetView(leftArmFrame: CGRect(x: 100, y: 100, width: 200, height: 200),
                            rightArmFrame: CGRect(x: 300, y: 100, width: 200, height: 200))
        }
    }
