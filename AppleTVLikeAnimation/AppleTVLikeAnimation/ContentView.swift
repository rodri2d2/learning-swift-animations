//
//  ContentView.swift
//  AppleTVLikeAnimation
//
//  Created by Rodrigo Candido on 2/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimating = false
    
    //
    let gradient = Gradient(colors: [.blue, .black])
    
    
    var body: some View {
        ZStack {
            
            // MARK: -
            VStack {
                Text("AppleTV Like animation")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
    
                
                VStack {
                    Image("rodri")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(25)
                        .shadow(color: .gray, radius: 50, x: -10, y: 5)
                }
                .rotation3DEffect(
                    .degrees(isAnimating ? Double.random(in: 0.0...13.0) : -13),
                    axis: (
                        x: isAnimating ? Double.random(in: 0.0...90.0) : -45,
                        y: isAnimating ? Double.random(in: 0.0...45.0) : 90,
                        z: 0
                    )
                )
                .animation(
                    Animation
                        .easeInOut(duration: 3.5)
                        .repeatForever(autoreverses: true),
                    value: isAnimating
                )
                .onAppear {
                    isAnimating.toggle()
                }
                .padding()
            }
        }
    }
}

