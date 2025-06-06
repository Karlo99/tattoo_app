//
//  TrashcanView.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 5/19/25.
//

import SwiftUI


struct TrashcanView: View {
    var onDropAction: () -> Void
    @State private var isHovering: Bool = false
    
    var body: some View {
        Image(systemName: "trash.fill")
            .font(.largeTitle)
            .padding()
            .onDrop(of: ["public.image"], isTargeted: nil) { _ in
                onDropAction()
                return true
            }
            .animation(.easeInOut(duration: 0.2), value: isHovering)
    }
}

#Preview {
    TrashcanView {
        print("Image dropped in preview!")
    }
}

