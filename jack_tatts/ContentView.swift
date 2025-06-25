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
        let duration = Double.random(in: 2...4)
        withAnimation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true)) {
            yOffset = CGFloat.random(in: -maxYOffset...maxYOffset)
            opacity = Double.random(in: 0.0...1.0)
        }

        // Change the values slightly every few seconds for organic feel
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

    var body: some View {
            ZStack {
                Color.clear.ignoresSafeArea()

                // 💡 Centered content using full-screen ZStack
                ZStack {
                    
                    AnimatedCloud(imageName: "cloud7", initialOffset: CGSize(width: -25, height: -50), maxYOffset: 20, size: CGSize(width: 40, height: 100))

                    AnimatedCloud(imageName: "cloud1", initialOffset: CGSize(width: -60, height: -105), maxYOffset: 20, size: CGSize(width: 70, height: 100))

                    AnimatedCloud(imageName: "cloud5", initialOffset: CGSize(width: 120, height: 20), maxYOffset: 15, size: CGSize(width: 25, height: 100))

                    AnimatedCloud(imageName: "cloud2", initialOffset: CGSize(width: 220, height: 100), maxYOffset: 30, size: CGSize(width: 80, height: 80))

                    AnimatedCloud(imageName: "cloud3", initialOffset: CGSize(width: 0, height: -150), maxYOffset: 25, size: CGSize(width: 100, height: 90))

                    AnimatedCloud(imageName: "cloud9", initialOffset: CGSize(width: -180, height: -150), maxYOffset: 25, size: CGSize(width: 60, height: 60))
                    
                    
                    CartoonCloudsView()
                    // Go Button (400px wide)
                    Button(action: {
                        print("Go button tapped")
                    }) {
                        Image("go")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 125, height: 150)
                            
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

struct CartoonCloudsView: View {
    @State private var currentCloudIndex = 0
    let cloudImages = ["goCloud1", "goCloud2", "goCloud3", "goCloud5"]

    var body: some View {
        ZStack {
            Image(cloudImages[currentCloudIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 120)
                .transition(.opacity)
                .id(currentCloudIndex) // Forces view reload for transition
        }
        .animation(.easeInOut(duration: 2), value: currentCloudIndex)
        .onAppear {
            startLoopingAnimation()
        }
    }

    func startLoopingAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
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

