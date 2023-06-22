//
//  ContentView.swift
//  AnimatingCircles
//
//  Created by Rodrigo Candido on 22/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scaleInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false
    
    let gradientColors = Gradient(colors: [Color.green, Color.white])
    let rotations = [0.0, 60.0, 120.0]
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                ForEach(rotations, id: \.self) { rotation in
                    createCircleStack()
                        .rotationEffect(.degrees(rotation))
                }
                .rotationEffect(.degrees(rotateInOut ? 90 : 0))
                .scaleEffect(scaleInOut ? 1 : 0)
                //  Animation defines how transitions of modifiable values occur.
                // easeInOut causes the animation to start slowly, speed up through the middle, and then slow down at the end.
                // repeatForever causes the animation to repeat indefinitely.
                // autoreverses the animation to play in reverse before repeating.
                // value defines what value must change for the animation to play.
                .animation(
                    Animation
                        .easeInOut
                        .repeatForever(autoreverses: true)
                        .speed(1/4),
                    value: moveInOut
                )
            }
            // onAppear defines a block of code that executes when the view appears.
            // In this case, it changes the values of the state variables to start the animations.
            .onAppear {
                moveInOut.toggle()
                scaleInOut.toggle()
                rotateInOut.toggle()
            }
        }
    }
    
    func customCircle() -> some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: gradientColors,
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
    
    func createCircleStack() -> some View {
        ZStack {
            customCircle()
                .frame(width: 120, height: 120)
                .offset(y: moveInOut ? -60 : 0)
            
            customCircle()
                .frame(width: 120, height: 120)
                .offset(y: moveInOut ? 60 : 0)
        }
        .opacity(0.5)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
