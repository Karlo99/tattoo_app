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
    
    let rows = [GridItem(.flexible())]
    let cloudWidth: CGFloat = 350
    let cloudHeight: CGFloat = 150
//    let scrollContentWidth: CGFloat = 800
    
    var body: some View {
            ZStack {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHGrid(rows: rows, spacing: 20) {
                        ForEach(tattoos.indices, id: \.self) { index in
                            let tattoo = tattoos[index]
                            
                            Image(tattoo.name)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140, height: 140)
                                .offset(tattoos[index].offset)
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            tattoos[index].offset = value.translation
                                        }
                                )
                        }
                    }
                    .padding(.horizontal)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: cloudHeight, maxHeight: cloudHeight)
                }
                .frame(width: cloudWidth, height: cloudHeight)
                
                .mask(
                    Image("skinnyScrollCloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width: cloudWidth, height: cloudHeight)
                    
                )
                Image("transScrollCloud")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: cloudWidth, height: cloudHeight)
            }
    
            .frame(width: cloudWidth, height: cloudHeight)
                    
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
            BottomSheetView()
        }
    }
