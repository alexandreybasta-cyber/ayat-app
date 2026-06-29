import Foundation
import AVFoundation

class AudioPlayerService: ObservableObject {
    static let shared = AudioPlayerService()
    
    @Published var isPlaying = false
    @Published var currentVerseId: UUID?
    
    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    
    init() {
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Audio session setup failed: \(error)")
        }
    }
    
    func play(url: URL, verseId: UUID) {
        stop()
        
        playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        
        currentVerseId = verseId
        isPlaying = true
        
        player?.play()
        
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndOfTime,
            object: playerItem,
            queue: .main
        ) { [weak self] _ in
            self?.stop()
        }
    }
    
    func stop() {
        player?.pause()
        player = nil
        playerItem = nil
        isPlaying = false
        currentVerseId = nil
    }
    
    func togglePlayback(url: URL, verseId: UUID) {
        if currentVerseId == verseId && isPlaying {
            stop()
        } else {
            play(url: url, verseId: verseId)
        }
    }
}
