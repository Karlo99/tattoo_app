//
//  MainView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/20/25.
//

import SwiftUI


struct MainView: View {
    
    @State private var leftArmFrame: CGRect = .zero
    @State private var rightArmFrame: CGRect = .zero
    
    @State private var droppedTattoos: [DraggableTattoo] = []
    

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    
                    ZStack{
                        
                        TattoosView(droppedTattoos: $droppedTattoos)
                            .zIndex(1)
                        
                        ArmsView()
                            .zIndex(0)
                        
                      }
                    BottomSheetView(
                        onTattooDragged: { tattoo in
                            droppedTattoos.append(tattoo)
                        },
                        leftArmFrame: leftArmFrame,
                        rightArmFrame: rightArmFrame
                    )
                    
                  }
                
            }
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
        MainView()
    }
}
