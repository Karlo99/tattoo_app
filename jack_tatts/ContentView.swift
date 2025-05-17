//
//  ContentView.swift
//  jack_tatts
//
//  Created by carlos monterosa on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea() // fills the screen
            Image("explanation")
                            .resizable()
                            .frame(width: 300, height: 500)
                            .padding()

    
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
