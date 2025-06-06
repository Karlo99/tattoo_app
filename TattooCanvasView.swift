////
////  TattooCanvasView.swift
////  jack_tatts
////
////  Created by Mariana Montoya on 6/6/25.
////
//
//import SwiftUI
//
//struct TattooCanvasView: View {
//    @State private var tattoos: [DraggableTattoo] = []
//    
//    var body: some View {
//        ZStack {
//            Image("background")
//                .resizable()
//                .scaledToFit()
//                .ignoresSafeArea()
//            
//            ForEach(tattoos) { tattoo in
//                Image(tattoo.name)
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .position(tattoo.position)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { value in
//                                if let index = tattoos.firstIndex(where: { $0.id == tattoo.id }) {
//                                    tattoos[index].position = value.location
//                                }
//                            }
//                    )
//            }
//        }
//        .overlay(
//            VStack
//            
//            
//        )
//    }
//}
//
//#Preview {
//    TattooCanvasView()
//}
