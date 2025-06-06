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
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    
    var body: some View {
        VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVGrid(columns: columns) {
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
                                    tattoos[index].offset = value.translation}
                                .onEnded {
                                    _ in
                                }
                            )
                        }
                    }
                    .padding()
                    
                }
        }
        .background(
            Image("background")
                .ignoresSafeArea(.all)
        )
        .onAppear(){
            let names = loadTattooNames()
            tattoos = names.map { DraggableTattoo(name: $0) }
            print("Loaded tattoos:", names)
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
