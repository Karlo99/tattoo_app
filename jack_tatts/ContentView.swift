import SwiftUI

struct CartoonSmokePuff: View {
    @State private var puff = false

    var body: some View {
        ZStack {
            cloudShape
                .scaleEffect(puff ? 2.2 : 0.4)
                .opacity(puff ? 0 : 1)
                .offset(y: puff ? -50 : 0)
                .onAppear {
                    withAnimation(.easeOut(duration: 1.0)) {
                        puff = true
                    }
                }
        }
        .frame(width: 120, height: 120)
    }


    // Each puff circle with fill and stroke
    func cloudBlob(offsetX: CGFloat, offsetY: CGFloat, size: CGFloat) -> some View {
        Circle()
            .frame(width: size, height: size)
            .offset(x: offsetX, y: offsetY)
            .background(Circle().fill(Color.white))
            .overlay(Circle().stroke(Color.black, lineWidth: 2))
    }
}

