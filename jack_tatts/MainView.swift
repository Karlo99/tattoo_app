//
//  MainView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/20/25.
//

import SwiftUI


struct MainView: View {
    @State private var showMenu = false
    
    @Binding var imageOffset: CGSize
    @Binding var isImageVisible: Bool
    
    @State private var dragStartPosition: CGSize = .zero
    
    //For removing Images:
//    @State private var images: [UIImage] = [...] // your image data
    @State private var removedImages: [UIImage] = []

    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                // Background
                
                // Side menu (toggle with button)
                SideMenuView(
                    isShowing: $showMenu,
                    imageOffset: $imageOffset,
                    isImageVisible: $isImageVisible
                )
                
                
                // Draggable image
                if isImageVisible {
                    Image("go")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                    //Places the image where the user drags it
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
                                } //Tracks where the user leaves the image
                        )
                    // Allows it to be draggable to different items such as trashcan
                        .onDrag {
                            return NSItemProvider(object: UIImage(named: "go") ?? UIImage())
                        }
                }
                
                // The Go Button
                if !showMenu {
                    VStack {
                        Button(action: {
                            showMenu.toggle()
                            
                        }) {
                            Image("go")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 600, height: 600)
                            
                        }
                        //offset for go button
                        .offset(x: -100, y: 80)
                        
                        
                        HStack(spacing: -150) {
                            Image("clenched_fist")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 400, height: 400)
                            //Flips it horizontally
                                .scaleEffect(x: -1, y: 1)

                            Image("clenched_fist")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 400, height: 400)
                        }
                        //offset for arms
                        .offset(x: 0, y: -300)
                            
                    }
                    
                }
                
                
                //                TrashcanView {
                //                    isImageVisible = false
                //                    imageOffset = .zero
                //                }
                //                .padding()
                
             
            }
            
            //Hides the toolbar when its clicked
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("jack_stacks_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                    // adjust the vertical positioning to the logo
                        .offset(y: -60)
                }
            }

            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
            )

        }
    }
}


#Preview {
    MainViewPreviewWrapper()
}

struct MainViewPreviewWrapper: View {
    @State private var offset: CGSize = .zero
    @State private var visible: Bool = false

    var body: some View {
        MainView(imageOffset: $offset, isImageVisible: $visible)
    }
}
