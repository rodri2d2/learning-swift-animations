//
//  PlaySound.swift
//  RecordPlayer
//
//  Created by Rodrigo Candido on 23/6/23.
//

import Foundation
import AVFoundation

class AudioPlayer {
    private var player: AVAudioPlayer?
    
    func playSong(named songName: String, withExtension fileExtension: String) {
        guard let url = Bundle.main.url(forResource: songName, withExtension: fileExtension) else {
            print("Could not find song file: \(songName).\(fileExtension)")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Failed to play song: \(error.localizedDescription)")
        }
    }
    
    func stopPlaying() {
        player?.stop()
    }
}
