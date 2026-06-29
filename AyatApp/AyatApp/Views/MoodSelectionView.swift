import SwiftUI

struct MoodSelectionView: View {
    @State private var animateCards = false
    
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Gradient Header
                headerView
                
                // Tagline
                Text("Select how you feel, and let the Quran speak to your heart")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "64748B"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                    .padding(.bottom, 16)
                
                // Mood Grid
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(Array(Mood.allCases.enumerated()), id: \.element.id) { index, mood in
                        NavigationLink(destination: VersesView(mood: mood)) {
                            MoodCardView(mood: mood)
                                .opacity(animateCards ? 1 : 0)
                                .offset(y: animateCards ? 0 : 20)
                                .animation(
                                    .spring(response: 0.5, dampingFraction: 0.7)
                                    .delay(Double(index) * 0.05),
                                    value: animateCards
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
        .background(Color(hex: "F0FDFA"))
        .navigationBarHidden(true)
        .onAppear {
            withAnimation {
                animateCards = true
            }
        }
    }
    
    private var headerView: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "0F766E"),
                    Color(hex: "0D9488"),
                    Color(hex: "14B8A6")
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(spacing: 4) {
                Text("آيَات")
                    .font(.system(size: 36, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                
                Text("Ayat")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Verses for Your Soul")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white.opacity(0.9))
                    .padding(.top, 2)
            }
            .padding(.vertical, 32)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Mood Card
struct MoodCardView: View {
    let mood: Mood
    @State private var isPressed = false
    
    var body: some View {
        VStack(spacing: 8) {
            Text(mood.emoji)
                .font(.system(size: 32))
            
            Text(mood.title)
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(Color(hex: "0F766E"))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .padding(.horizontal, 8)
        .background(Color.white)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(mood.color.opacity(0.3), lineWidth: 2)
        )
        .shadow(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 2)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
    }
}
