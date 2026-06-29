import SwiftUI

struct VerseCardView: View {
    let verse: Verse
    @ObservedObject var audioPlayer: AudioPlayerService
    
    @State private var appeared = false
    
    private var isCurrentlyPlaying: Bool {
        audioPlayer.currentVerseId == verse.id && audioPlayer.isPlaying
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Arabic Text
            Text(verse.arabic)
                .font(.system(size: 22, weight: .regular, design: .serif))
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .environment(\.layoutDirection, .rightToLeft)
                .foregroundColor(Color(hex: "1E293B"))
                .lineSpacing(10)
            
            Divider()
                .background(Color(hex: "E2E8F0"))
            
            // English Translation
            Text("\"\(verse.translation)\"")
                .font(.system(size: 15))
                .foregroundColor(Color(hex: "64748B"))
                .italic()
                .lineSpacing(4)
            
            // Footer
            HStack {
                // Reference Badge
                Text(verse.reference)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color(hex: "0F766E"))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color(hex: "99F6E4").opacity(0.4))
                    .cornerRadius(12)
                
                Spacer()
                
                // Audio Button
                if let audioUrl = verse.audioUrl {
                    Button(action: {
                        audioPlayer.togglePlayback(url: audioUrl, verseId: verse.id)
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: isCurrentlyPlaying ? "pause.fill" : "play.fill")
                                .font(.system(size: 12))
                            Text(isCurrentlyPlaying ? "Playing..." : "Play")
                                .font(.system(size: 12, weight: .medium))
                        }
                        .foregroundColor(Color(hex: "D4A853"))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color(hex: "FEF3C7").opacity(0.6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(hex: "D4A853"), lineWidth: 1)
                        )
                        .cornerRadius(8)
                    }
                    .opacity(isCurrentlyPlaying ? 0.8 : 1.0)
                    .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: isCurrentlyPlaying)
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "0F766E").opacity(0.1), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 3)
        .opacity(appeared ? 1 : 0)
        .offset(y: appeared ? 0 : 15)
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                appeared = true
            }
        }
    }
}
