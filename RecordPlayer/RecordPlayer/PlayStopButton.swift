//
//  PlayStopButton.swift
//  RecordPlayer
//
//  Created by Rodrigo Candido on 23/6/23.
//

import SwiftUI


struct PlayStopButton: View {
    
    //
    @Binding var shouldAnimate: Bool
    @Binding var degrees: Double
    @Binding var rotateArm: Bool
    
    //
    let audioPlayer = AudioPlayer()
    let maxRotationDegrees: Double
   
    var body: some View {
        Button {
            shouldAnimate.toggle()
            if shouldAnimate {
                degrees = Double(maxRotationDegrees)
                rotateArm.toggle()
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                    audioPlayer.playSong(named: "music", withExtension: "m4a")
                }
            } else {
                rotateArm.toggle()
                degrees = 0
                audioPlayer.stopPlaying()
            }
        } label: {
            HStack {
                Text(shouldAnimate ? "Stop" : "Play")
                Image(systemName: shouldAnimate ? "stop.fill" : "play.circle.fill")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule()
                    .strokeBorder(Color.red, lineWidth: 1.25)
            )
            .foregroundColor(.red)
        }
    }
}

struct PlayStopButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayStopButton(shouldAnimate: .constant(true), degrees: .constant(16000), rotateArm: .constant(true), maxRotationDegrees: 0)
    }
}
