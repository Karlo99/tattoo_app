//
//  MainView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/20/25.
//

import SwiftUI


struct MainView: View {
    @State private var showMenu = false
    @State private var showingBottomSheet = false
    
    @Binding var imageOffset: CGSize
    @Binding var isImageVisible: Bool
    
    @State private var dragStartPosition: CGSize = .zero
    @State private var isDraggingTattoo: Bool = false
    
    @State private var removedImages: [UIImage] = []

    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    
                    ZStack{
                        // Arms at the back
                          HStack(spacing: -150) {
                              Image("clenched_fist")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 400, height: 400)
                                  .scaleEffect(x: -1, y: 1)

                              Image("clenched_fist")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 400, height: 400)
                          }

                          // Tattoo above the fists
                          if isImageVisible {
                              TattooImageView(
                                  imageOffset: $imageOffset,
                                  dragStartPosition: $dragStartPosition,
                                  isImageVisible: $isImageVisible,
                                  isDragging: $isDraggingTattoo,
                                  onDragEnd: {
                                      if imageOffset.height < -100 {
                                          isImageVisible = true
                                          showingBottomSheet = false
                                      }
                                  }
                              )

                          }
                      }

                      Spacer()
                  }

                  // Go Button
                  if !showMenu {
                      Button(action: {
                          showingBottomSheet.toggle()
                      }) {
                          Image("go")
                              .resizable()
                              .scaledToFit()
                              .frame(width: 100, height: 100)
                      }
                      .offset(x: -270, y: 180)
                      .sheet(isPresented: $showingBottomSheet) {
                          BottomSheetView()
                            .presentationDetents([.fraction(0.2), .medium])
                      }
                    }
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
