//
//  HelpSheetView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 7/12/25.
//

import SwiftUI

struct HelpSheetView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("background")
                .resizable()
                .ignoresSafeArea()  // This ensures it covers the entire screen
            
            // Foreground Image or Content
            Image("explanation")
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    HelpSheetView()
}
