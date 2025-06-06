//
//  BottomMenuView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/25/25.
//

import SwiftUI

struct BottomMenuView: View {

    var body: some View {
        VStack{
            Image("scrollCloud")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 450, maxHeight: 1000)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Image("background"))
    }
}

#Preview {
    BottomMenuViewPreviewWrapper()
}

struct BottomMenuViewPreviewWrapper: View {
    var body: some View {
        BottomMenuView()
    }
}

