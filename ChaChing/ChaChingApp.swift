//
//  ChaChingApp.swift
//  ChaChing
//
//  Created by Jorge Bernal on 26/5/21.
//

import SwiftUI
import AudioToolbox
import AVFoundation

@main
struct ChaChingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

let soundURL = Bundle.main.url(forResource: "o", withExtension: "caf")!

struct AudioServicesPlayer {
    static let shared: Self = .init()

    private var soundID: SystemSoundID = 0

    init() {
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
    }

    func play() {
        AudioServicesPlaySystemSound(soundID)
    }
}

struct AVFoundationPlayer {
    static let shared: Self = .init()

    let player = try! AVAudioPlayer(contentsOf: soundURL)

    func play() {
        player.play()
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Play using Audio Services") {
                AudioServicesPlayer.shared.play()
            }
            Button("Play using AVFoundation") {
                AVFoundationPlayer.shared.play()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
