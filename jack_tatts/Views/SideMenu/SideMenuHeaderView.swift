//
//  SideMenuHeaderView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/19/25.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        VStack {
            HStack{
                VStack {
                    Image("jack_stacks_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                }
            }
            
        }
        .padding(.bottom, 830)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(
            Image("background")
                .resizable()
        )
    }
}

#Preview {
    SideMenuHeaderView()
}
