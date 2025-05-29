//
//  ContentView.swift
//  jack_tatts
//
//  Created by carlos monterosa on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var offset: CGSize = .zero
    @State private var visible: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea() // fills the screen
                Image("explanation")
                    .resizable()
                    .frame(width: 300, height: 500)
                    .padding()
                NavigationLink {
                    MainView(imageOffset: $offset, isImageVisible: $visible)
                } label: {
                    Text("Click Here to Start")
                }
                .padding(.top, 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


