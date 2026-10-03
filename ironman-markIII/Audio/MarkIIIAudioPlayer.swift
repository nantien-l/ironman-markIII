import Foundation
import AVFoundation

@MainActor
final class MarkIIIAudioPlayer {
    static let shared = MarkIIIAudioPlayer()
    private var audioPlayer: AVAudioPlayer?

    private init() {
        prepareAudio()
    }

    func prepareAudio() {
        guard audioPlayer == nil else { return }
        let url = Bundle.main.url(forResource: "ironman", withExtension: "m4a")
            ?? Bundle.main.url(forResource: "ironman", withExtension: "m4a", subdirectory: "Audio")
        if let url {
            do {
                let player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
                self.audioPlayer = player
            } catch {
                print("Failed to load audio: \(error)")
            }
        } else {
            print("Audio file ironman.m4a not found in bundle resources")
        }
    }

    var duration: TimeInterval {
        if let audioPlayer, audioPlayer.duration > 0 {
            return audioPlayer.duration
        }
        return 52.541417
    }

    func play(from progress: Double = 0) {
        prepareAudio()
        guard let audioPlayer else { return }
        
        // Ensure audio playback works on silent mode on iOS if applicable
        #if os(iOS)
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try? AVAudioSession.sharedInstance().setActive(true)
        #endif

        let startTime = max(0, min(audioPlayer.duration, progress * audioPlayer.duration))
        audioPlayer.currentTime = startTime
        audioPlayer.play()
    }

    func pause() {
        audioPlayer?.pause()
    }

    func stop() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
}
