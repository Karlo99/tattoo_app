//
//  SideMenuRowView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/19/25.
//

import SwiftUI

struct SideMenuRowView: View {
    var body: some View {
        HStack {
            Image(systemName: "paperplane")
                .imageScale(.large)
            
            Text("Messages")
                .font(.subheadline)
            
            Spacer()
        }
        .padding(.leading)
        .frame(height: 44)
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea()
        )

    }
}

#Preview {
    SideMenuRowView()
}
