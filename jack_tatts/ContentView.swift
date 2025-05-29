import SwiftUI

struct CloudyGoButton: View {
    @State private var animateCloud1 = false
    @State private var animateCloud2 = false
    @State private var animateCloud3 = false

    var body: some View {
            ZStack {
                Color.clear.ignoresSafeArea()

                // 💡 Centered content using full-screen ZStack
                ZStack {
                    

                    // Cloud 1 (top-left)
                    Image("cloud1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x: -50, y: animateCloud1 ? -50 : -100)
                        .frame(width: 100, height: 100)
                        .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.red, lineWidth: 4)
                        )
                        .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true), value: animateCloud1)

                    // Cloud 2 (bottom-right)
                    Image("cloud2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x: 220, y: animateCloud2 ? 130 : 100)
                        .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true), value: animateCloud2)

                    // Cloud 3 (floating above)
                    Image("cloud3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(y: animateCloud3 ? -180 : -150)
                        .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: animateCloud3)
                    
                    // Go Button (400px wide)
                    Button(action: {
                        print("Go button tapped")
                    }) {
                        Image("go")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.red, lineWidth: 4)
                            )
                            
                    }
                }
                // 👇 Force the ZStack to take the entire screen and center its content
//                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
            .onAppear {
                animateCloud1 = true
                animateCloud2 = true
                animateCloud3 = true
        }
    }
}


struct CloudyGoButton_Previews: PreviewProvider {
    static var previews: some View {
        CloudyGoButton()
    }
}

