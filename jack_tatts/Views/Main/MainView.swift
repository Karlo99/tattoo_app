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
    
    @State private var selectedTattooName: String? = nil
    @State private var removedImages: [UIImage] = []
    
    @State private var leftArmFrame: CGRect = .zero
    @State private var rightArmFrame: CGRect = .zero
    

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    
                    ZStack{
                        // Arms at the back
                          HStack(spacing: -150) {
                              // Using Geo Reader to be able to know location of the arms
                              GeometryReader { geo in
                                  
                                  Image("clenched_fist")
                                      .resizable()
                                      .scaledToFit()
                                      .frame(width: 400, height: 400)
                                      .scaleEffect(x: -1, y: 1)
                                      .onAppear {
                                          leftArmFrame = geo.frame(in: .global)
                                      }
                                      .onChange(of: geo.frame(in: .global)) { newValue in
                                          leftArmFrame = newValue
                                      }
                              }
                              .frame(width: 400, height: 400)
                              
                              GeometryReader { geo in
                                  Image("clenched_fist")
                                      .resizable()
                                      .scaledToFit()
                                      .frame(width: 400, height: 400)
                                      .onAppear {
                                          rightArmFrame = geo.frame(in: .global)
                                      }
                                      .onChange(of: geo.frame(in: .global)) { newValue in
                                          rightArmFrame = newValue
                                      }
                                  
                              }
                              .frame(width: 400, height: 400)
                              
                              
                          }
                        
                      }
                    BottomSheetView(leftArmFrame: leftArmFrame,
                                    rightArmFrame: rightArmFrame)
                        .padding(15)
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
