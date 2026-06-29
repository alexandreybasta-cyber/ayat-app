import Foundation

class QuranAPIService {
    static let shared = QuranAPIService()
    private let baseURL = "https://api.alquran.cloud/v1"
    
    func fetchVerse(surah: Int, ayah: Int) async throws -> Verse {
        // Fetch Arabic text
        let arabicURL = URL(string: "\(baseURL)/ayah/\(surah):\(ayah)/quran-uthmani")!
        let (arabicData, _) = try await URLSession.shared.data(from: arabicURL)
        let arabicResponse = try JSONDecoder().decode(QuranResponse.self, from: arabicData)
        
        // Fetch English translation
        let englishURL = URL(string: "\(baseURL)/ayah/\(surah):\(ayah)/en.sahih")!
        let (englishData, _) = try await URLSession.shared.data(from: englishURL)
        let englishResponse = try JSONDecoder().decode(QuranResponse.self, from: englishData)
        
        // Construct audio URL
        let surahStr = String(format: "%03d", surah)
        let ayahStr = String(format: "%03d", ayah)
        let audioUrl = URL(string: "https://everyayah.com/data/Alafasy_128kbps/\(surahStr)\(ayahStr).mp3")
        
        let surahName = arabicResponse.data.surah.englishName
        
        return Verse(
            surah: surah,
            ayah: ayah,
            arabic: arabicResponse.data.text,
            translation: englishResponse.data.text,
            reference: "\(surahName) \(surah):\(ayah)",
            audioUrl: audioUrl
        )
    }
    
    func fetchVerses(references: [VerseReference]) async -> [Verse] {
        var verses: [Verse] = []
        for ref in references {
            do {
                let verse = try await fetchVerse(surah: ref.surah, ayah: ref.ayah)
                verses.append(verse)
            } catch {
                print("Failed to fetch verse \(ref.surah):\(ref.ayah): \(error)")
            }
        }
        return verses
    }
}

// MARK: - API Response Models
struct QuranResponse: Decodable {
    let data: QuranData
}

struct QuranData: Decodable {
    let text: String
    let surah: SurahInfo
}

struct SurahInfo: Decodable {
    let englishName: String
}
