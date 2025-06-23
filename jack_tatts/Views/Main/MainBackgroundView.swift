//
//  MainBackgroundView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/23/25.
//

import SwiftUI

struct MainBackgroundView: View {
    var body: some View {
        Image("background")
            .resizable()
            .ignoresSafeArea()
    }
}

#Preview {
    MainBackgroundView()
}
