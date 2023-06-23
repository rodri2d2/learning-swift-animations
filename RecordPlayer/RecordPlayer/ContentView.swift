//
//  ContentView.swift
//  RecordPlayer
//
//  Created by Rodrigo Candido on 23/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotateRecord = false
    @State private var rotateArm = false
    @State private var shouldAnimate = false
    @State private var degrees = 0.0
    
    //
    let gradient = Gradient(colors: [.white, .black])
    
    let maxRotationDegrees: Double
    = 18000
    
    var body: some View {
        ZStack {
            VStack {
                
                // MARK: - Disk view
                RecordView(degrees: $degrees, shouldAnimate: $shouldAnimate)
                
                // MARK: - Arm view
                ArmView(shouldRotateArm: $shouldAnimate)
                
                // MARK: - Play stop button
                PlayStopButton(
                    shouldAnimate: $shouldAnimate,
                    degrees: $degrees,
                    rotateArm: $rotateArm,
                    maxRotationDegrees: maxRotationDegrees
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
