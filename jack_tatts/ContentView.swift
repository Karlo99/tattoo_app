import SwiftUI

struct CloudyGoButton: View {
    @State private var animateCloud1 = false
    @State private var animateCloud2 = false
    @State private var animateCloud3 = false
    
    @State private var imageOffset: CGSize = .zero
    @State private var isImageVisible: Bool = false
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            
            // 💡 Centered content using full-screen ZStack
            ZStack {
                
                
//                
//                Image("cloud7")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 50, height: 100)
//                    .offset(y: animateCloud3 ? -20 : -100)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(Color.red, lineWidth: 4)
//                    )
//                    .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: animateCloud3)
//                
//                // Cloud 1 (top-left)
//                Image("cloud1")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .offset(x: -50, y: animateCloud1 ? -50 : -100)
//                    .frame(width: 100, height: 100)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(Color.red, lineWidth: 4)
//                    )
//                    .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true), value: animateCloud1)
//                
//                
//                
//                Image("cloud5")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 25, height: 100)
//                    .offset(x: 120, y: animateCloud1 ? -50 : -60)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(Color.red, lineWidth: 4)
//                    )
//                    .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true), value: animateCloud1)
//                
//                
//                // Cloud 2 (bottom-right)
//                Image("cloud2")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .offset(x: 220, y: animateCloud2 ? 130 : 100)
//                    .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true), value: animateCloud2)
//                
//                
//                // Cloud 3 (floating above)
//                Image("cloud3")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .offset(y: animateCloud3 ? -180 : -150)
//                    .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: animateCloud3)
//                
//                // Cloud 3 (floating above)
//                Image("cloud9")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 60)
//                    .offset(x: -180, y: animateCloud3 ? -170 : -150)
//                    .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: animateCloud3)
//
                NavigationStack {
                    NavigationLink(destination: MainView(
                        
                    )) {
                        Image("go")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100) // Adjust size as needed
                            .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                
                // Go Button (400px wide)
//                Button(action: {
//                    print("Go button tapped")
//                }) {
//                    Image("go")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 150, height: 150)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 16)
//                                .stroke(Color.red, lineWidth: 4)
//                        )
//                    
//                }
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
    
}
