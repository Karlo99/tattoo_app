//
//  CloudyGoButtonView.swift
//  jack_tatts
//
//  Created by carlos monterosa on 7/7/25.
//
import SwiftUI

struct CloudyGoButton: View {
    @State private var animateCloud1 = false
    @State private var animateCloud2 = false
    @State private var animateCloud3 = false
    @State private var cloudsAreVisible = false
    @State private var goButtonPressed = false
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.clear.ignoresSafeArea()
                
                // 💡 Centered content using full-screen ZStack
                ZStack {
                    // Cloud7 floating above go!
                    Image("cloud7")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 100)
                    //.opacity(cloudsAreVisible ? 1 : 0)
                        .offset(x: -25, y: animateCloud3 ? -100 : -90)
                        .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: animateCloud3)
                    
                    Image("cloud11")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    //.opacity(cloudsAreVisible ? 1 : 0)
                        .offset(x: 170, y: animateCloud3 ? 200 : 210)
                        .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: animateCloud3)
                    
                    Image("cloud5")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                    //.opacity(cloudsAreVisible ? 1 : 0)
                        .offset(x: 120, y: animateCloud3 ? -230 : -250)
                        .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: animateCloud3)
                    
                    Image("cloud9")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                    //                        .opacity(cloudsAreVisible ? 1 : 0)
                        .offset(x: -180, y: animateCloud3 ? -180 : -160)
                        .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true), value: animateCloud1)
                    
                    
                    //                    Group {
                    //
                    //                        AnimatedCloud(imageName: "cloud7", initialOffset: CGSize(width: -25, height: -100), maxYOffset: 20, size: CGSize(width: 40, height: 100))
                    //
                    //                        AnimatedCloud(imageName: "cloud1", initialOffset: CGSize(width: -60, height: -160), maxYOffset: 20, size: CGSize(width: 70, height: 100))
                    //
                    //                        AnimatedCloud(imageName: "cloud5", initialOffset: CGSize(width: 120, height: 20), maxYOffset: 15, size: CGSize(width: 25, height: 100))
                    //
                    //                        AnimatedCloud(imageName: "cloud2", initialOffset: CGSize(width: -200, height: -200), maxYOffset: 30, size: CGSize(width: 200, height: 200))
                    //
                    //                        AnimatedCloud(imageName: "cloud3", initialOffset: CGSize(width: 0, height: -180), maxYOffset: 25, size: CGSize(width: 100, height: 90))
                    //
                    //                        AnimatedCloud(imageName: "cloud9", initialOffset: CGSize(width: -180, height: -200), maxYOffset: 25, size: CGSize(width: 60, height: 60))
                    //
                    //                        AnimatedCloud(imageName: "cloud11", initialOffset: CGSize(width: 170, height: 200), maxYOffset: 10, size: CGSize(width: 100, height: 60))
                    //                    }
                    
                    
                    CartoonCloudsView()
                    // Go Button (400px wide)
                    Button(action: {
                        print("Go button tapped")
                        goButtonPressed = true
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
                withAnimation(.easeInOut(duration: 20)) {
                    cloudsAreVisible = true
                }
                
                
            }
            
            .navigationDestination(isPresented: $goButtonPressed){
                RazorView()
                    .navigationBarBackButtonHidden(true)

            }
        }
        
    }
}
