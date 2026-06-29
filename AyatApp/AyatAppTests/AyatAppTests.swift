import XCTest
@testable import AyatApp

final class AyatAppTests: XCTestCase {
    
    func testMoodCases() throws {
        // Verify all 9 mood cases exist
        XCTAssertEqual(Mood.allCases.count, 9)
    }
    
    func testMoodProperties() throws {
        let sadness = Mood.sadness
        XCTAssertEqual(sadness.title, "Sadness & Grief")
        XCTAssertEqual(sadness.emoji, "😢")
        XCTAssertEqual(sadness.rawValue, "sadness")
    }
    
    func testMoodVersePools() throws {
        // Verify all moods have verse pools
        for mood in Mood.allCases {
            let pool = MoodVersePools.pools[mood]
            XCTAssertNotNil(pool, "Pool missing for mood: \(mood.rawValue)")
            XCTAssertGreaterThanOrEqual(pool?.count ?? 0, 20, "Pool too small for mood: \(mood.rawValue)")
        }
    }
    
    func testVerseReference() throws {
        let ref = VerseReference(surah: 2, ayah: 153)
        XCTAssertEqual(ref.surah, 2)
        XCTAssertEqual(ref.ayah, 153)
    }
    
    func testVerse() throws {
        let verse = Verse(
            surah: 1,
            ayah: 1,
            arabic: "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
            translation: "In the name of Allah, the Entirely Merciful, the Especially Merciful.",
            reference: "Al-Fatihah 1:1",
            audioUrl: URL(string: "https://everyayah.com/data/Alafasy_128kbps/001001.mp3")
        )
        XCTAssertEqual(verse.surah, 1)
        XCTAssertEqual(verse.ayah, 1)
        XCTAssertFalse(verse.arabic.isEmpty)
        XCTAssertNotNil(verse.audioUrl)
    }
}
