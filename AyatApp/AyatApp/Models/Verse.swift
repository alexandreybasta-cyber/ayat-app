import Foundation

struct VerseReference: Identifiable {
    let id = UUID()
    let surah: Int
    let ayah: Int
}

struct Verse: Identifiable {
    let id = UUID()
    let surah: Int
    let ayah: Int
    var arabic: String
    var translation: String
    var reference: String
    var audioUrl: URL?
}
