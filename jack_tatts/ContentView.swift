import SwiftUI

struct AnimatedCloud: View {
    let imageName: String
    let initialOffset: CGSize
    let maxYOffset: CGFloat
    let size: CGSize

    @State private var yOffset: CGFloat = 0
    @State private var opacity: Double = 2.0

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.width, height: size.height)
            .offset(x: initialOffset.width, y: initialOffset.height + yOffset)
            .opacity(opacity)
            .onAppear {
                startRandomAnimationLoop()
            }
    }

    private func startRandomAnimationLoop() {
        let duration = Double.random(in: 1...20)
        withAnimation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true)) {
            yOffset = CGFloat.random(in: -maxYOffset...maxYOffset)
            opacity = Double.random(in: 0.0...0.01)
        }

        Timer.scheduledTimer(withTimeInterval: duration, repeats: true) { _ in
            withAnimation(Animation.easeInOut(duration: duration)) {
                yOffset = CGFloat.random(in: -maxYOffset...maxYOffset)
                opacity = Double.random(in: 0.0...0.5)
            }
        }
    }
}

struct CloudyGoButton: View {
    @State private var animateCloud1 = false
    @State private var animateCloud2 = false
    @State private var animateCloud3 = false
    @State private var cloudsAreVisible = false

    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            NavigationStack {
                ZStack {
                    // Optional: Replace these with AnimatedCloud views if you want dynamic animation
                    Image("cloud7")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 100)
                        .offset(x: -25, y: animateCloud3 ? -100 : -90)
                        .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: animateCloud3)
                    
                    Image("cloud11")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .offset(x: 170, y: animateCloud3 ? 200 : 210)
                        .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: animateCloud3)
                    
                    Image("cloud5")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .offset(x: 120, y: animateCloud3 ? -230 : -250)
                        .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: animateCloud3)
                    
                    Image("cloud9")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .offset(x: -180, y: animateCloud3 ? -180 : -160)
                        .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true), value: animateCloud1)
                    
                    // Optional: Fully animated clouds using your custom AnimatedCloud component
                    CartoonCloudsView()
                    
                    // Go Button with navigation
                    NavigationLink(destination: MainView()) {
                        Image("go")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 125, height: 150)
                            .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .preferredColorScheme(.light)
            .onAppear {
                animateCloud1 = true
                animateCloud2 = true
                animateCloud3 = true
                withAnimation(.easeInOut(duration: 20)) {
                    cloudsAreVisible = true
                }
            }
        }
    }
}

struct CartoonCloudsView: View {
    @State private var currentCloudIndex = 0
    let cloudImages = [
        "goCloud1", "goCloud2", "goCloud3", "goCloud5", "goCloud6",
        "goCloud8", "goCloud9", "goCloud10", "goCloud11", "goCloud12", "goCloud13"
    ]

    var body: some View {
        ZStack {
            Image(cloudImages[currentCloudIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 120)
                .id(currentCloudIndex)
        }
        .animation(.easeInOut(duration: 0.1), value: currentCloudIndex)
        .onAppear {
            startLoopingAnimation()
        }
    }

    func startLoopingAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { _ in
            withAnimation {
                currentCloudIndex = (currentCloudIndex + 1) % cloudImages.count
            }
        }
    }
}

struct CloudyGoButton_Previews: PreviewProvider {
    static var previews: some View {
        CloudyGoButton()
    }
}
