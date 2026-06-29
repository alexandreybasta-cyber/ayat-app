import SwiftUI

struct VersesView: View {
    let mood: Mood
    
    @State private var verses: [Verse] = []
    @State private var isLoading = true
    @State private var hasError = false
    @State private var shownIndices: Set<Int> = []
    @StateObject private var audioPlayer = AudioPlayerService.shared
    
    private let versesPerPage = 7
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Mood Header
                HStack(spacing: 12) {
                    Text(mood.emoji)
                        .font(.system(size: 36))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(mood.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "0F766E"))
                        
                        Text("7 verses selected for you")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "64748B"))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                if isLoading {
                    loadingView
                } else if hasError {
                    errorView
                } else {
                    versesListView
                }
            }
            .padding(.bottom, 24)
        }
        .background(Color(hex: "F0FDFA"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: refreshVerses) {
                    Label("Refresh", systemImage: "arrow.clockwise")
                        .foregroundColor(Color(hex: "0F766E"))
                }
                .disabled(isLoading)
            }
        }
        .task {
            await loadVerses()
        }
    }
    
    private var loadingView: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.5)
                .tint(Color(hex: "0F766E"))
            
            Text("Loading verses...")
                .font(.subheadline)
                .foregroundColor(Color(hex: "64748B"))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 60)
    }
    
    private var errorView: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 40))
                .foregroundColor(.red.opacity(0.7))
            
            Text("Failed to load verses")
                .font(.headline)
                .foregroundColor(Color(hex: "1E293B"))
            
            Text("Please check your internet connection and try again.")
                .font(.subheadline)
                .foregroundColor(Color(hex: "64748B"))
                .multilineTextAlignment(.center)
            
            Button(action: {
                Task { await loadVerses() }
            }) {
                Text("Try Again")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color(hex: "0F766E"))
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 60)
        .padding(.horizontal, 32)
    }
    
    private var versesListView: some View {
        LazyVStack(spacing: 16) {
            ForEach(Array(verses.enumerated()), id: \.element.id) { index, verse in
                VerseCardView(verse: verse, audioPlayer: audioPlayer)
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 20)),
                        removal: .opacity
                    ))
                    .animation(
                        .spring(response: 0.4, dampingFraction: 0.8)
                        .delay(Double(index) * 0.08),
                        value: verses.count
                    )
            }
        }
        .padding(.horizontal, 16)
    }
    
    // MARK: - Logic
    
    private func loadVerses() async {
        isLoading = true
        hasError = false
        
        let pool = MoodVersePools.pools[mood] ?? []
        let selectedRefs = getNextBatch(from: pool)
        
        let fetchedVerses = await QuranAPIService.shared.fetchVerses(references: selectedRefs)
        
        await MainActor.run {
            if fetchedVerses.isEmpty {
                hasError = true
            } else {
                verses = fetchedVerses
            }
            isLoading = false
        }
    }
    
    private func refreshVerses() {
        Task { await loadVerses() }
    }
    
    private func getNextBatch(from pool: [VerseReference]) -> [VerseReference] {
        let totalCount = pool.count
        guard totalCount > 0 else { return [] }
        
        // Get available indices (not yet shown)
        var available = Set(0..<totalCount).subtracting(shownIndices)
        
        // If not enough available, reset
        if available.count < versesPerPage {
            shownIndices.removeAll()
            available = Set(0..<totalCount)
        }
        
        // Randomly select from available
        let shuffled = Array(available).shuffled()
        let selected = Array(shuffled.prefix(versesPerPage))
        
        // Mark as shown
        shownIndices.formUnion(selected)
        
        return selected.map { pool[$0] }
    }
}
