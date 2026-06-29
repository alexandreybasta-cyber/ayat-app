import Foundation
import SwiftUI

enum Mood: String, CaseIterable, Identifiable {
    case sadness = "sadness"
    case anxiety = "anxiety"
    case anger = "anger"
    case motivation = "motivation"
    case peace = "peace"
    case gratitude = "gratitude"
    case repentance = "repentance"
    case guidance = "guidance"
    case optimism = "optimism"
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .sadness: return "Sadness & Grief"
        case .anxiety: return "Anxiety & Fear"
        case .anger: return "Anger & Frustration"
        case .motivation: return "Motivation & Hope"
        case .peace: return "Peace & Serenity"
        case .gratitude: return "Gratitude & Joy"
        case .repentance: return "Repentance & Forgiveness"
        case .guidance: return "Guidance & Clarity"
        case .optimism: return "Optimism & New Beginnings"
        }
    }
    
    var emoji: String {
        switch self {
        case .sadness: return "😢"
        case .anxiety: return "😰"
        case .anger: return "😡"
        case .motivation: return "💪"
        case .peace: return "🕊️"
        case .gratitude: return "😊"
        case .repentance: return "🤲"
        case .guidance: return "🧭"
        case .optimism: return "🌅"
        }
    }
    
    var color: Color {
        switch self {
        case .sadness: return Color(hex: "3B82F6")
        case .anxiety: return Color(hex: "8B5CF6")
        case .anger: return Color(hex: "EF4444")
        case .motivation: return Color(hex: "F59E0B")
        case .peace: return Color(hex: "10B981")
        case .gratitude: return Color(hex: "EC4899")
        case .repentance: return Color(hex: "6366F1")
        case .guidance: return Color(hex: "14B8A6")
        case .optimism: return Color(hex: "F97316")
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
