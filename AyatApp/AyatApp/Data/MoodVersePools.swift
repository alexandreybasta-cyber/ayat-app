import Foundation

struct MoodVersePools {
    static let pools: [Mood: [VerseReference]] = [
        .sadness: [
            VerseReference(surah: 2, ayah: 153), VerseReference(surah: 2, ayah: 155), VerseReference(surah: 2, ayah: 156),
            VerseReference(surah: 2, ayah: 157), VerseReference(surah: 2, ayah: 286), VerseReference(surah: 3, ayah: 139),
            VerseReference(surah: 3, ayah: 185), VerseReference(surah: 3, ayah: 186), VerseReference(surah: 9, ayah: 40),
            VerseReference(surah: 12, ayah: 86), VerseReference(surah: 12, ayah: 87), VerseReference(surah: 13, ayah: 28),
            VerseReference(surah: 16, ayah: 102), VerseReference(surah: 21, ayah: 83), VerseReference(surah: 21, ayah: 87),
            VerseReference(surah: 26, ayah: 80), VerseReference(surah: 29, ayah: 2), VerseReference(surah: 30, ayah: 60),
            VerseReference(surah: 39, ayah: 10), VerseReference(surah: 65, ayah: 3), VerseReference(surah: 74, ayah: 56),
            VerseReference(surah: 89, ayah: 27), VerseReference(surah: 90, ayah: 4), VerseReference(surah: 91, ayah: 9),
            VerseReference(surah: 93, ayah: 3), VerseReference(surah: 93, ayah: 4), VerseReference(surah: 93, ayah: 5),
            VerseReference(surah: 93, ayah: 6), VerseReference(surah: 93, ayah: 7), VerseReference(surah: 93, ayah: 8)
        ],
        .anxiety: [
            VerseReference(surah: 2, ayah: 286), VerseReference(surah: 3, ayah: 8), VerseReference(surah: 3, ayah: 173),
            VerseReference(surah: 7, ayah: 56), VerseReference(surah: 9, ayah: 51), VerseReference(surah: 11, ayah: 56),
            VerseReference(surah: 13, ayah: 28), VerseReference(surah: 16, ayah: 102), VerseReference(surah: 18, ayah: 28),
            VerseReference(surah: 20, ayah: 25), VerseReference(surah: 20, ayah: 46), VerseReference(surah: 21, ayah: 87),
            VerseReference(surah: 22, ayah: 35), VerseReference(surah: 25, ayah: 74), VerseReference(surah: 28, ayah: 24),
            VerseReference(surah: 33, ayah: 3), VerseReference(surah: 36, ayah: 82), VerseReference(surah: 38, ayah: 44),
            VerseReference(surah: 41, ayah: 30), VerseReference(surah: 47, ayah: 7), VerseReference(surah: 48, ayah: 4),
            VerseReference(surah: 51, ayah: 50), VerseReference(surah: 59, ayah: 22), VerseReference(surah: 64, ayah: 11),
            VerseReference(surah: 65, ayah: 3), VerseReference(surah: 66, ayah: 8), VerseReference(surah: 94, ayah: 5),
            VerseReference(surah: 94, ayah: 6), VerseReference(surah: 110, ayah: 3), VerseReference(surah: 114, ayah: 1)
        ],
        .anger: [
            VerseReference(surah: 3, ayah: 134), VerseReference(surah: 3, ayah: 186), VerseReference(surah: 7, ayah: 199),
            VerseReference(surah: 7, ayah: 200), VerseReference(surah: 12, ayah: 90), VerseReference(surah: 13, ayah: 22),
            VerseReference(surah: 16, ayah: 96), VerseReference(surah: 16, ayah: 125), VerseReference(surah: 16, ayah: 126),
            VerseReference(surah: 16, ayah: 127), VerseReference(surah: 20, ayah: 130), VerseReference(surah: 23, ayah: 96),
            VerseReference(surah: 25, ayah: 63), VerseReference(surah: 25, ayah: 72), VerseReference(surah: 28, ayah: 54),
            VerseReference(surah: 38, ayah: 44), VerseReference(surah: 40, ayah: 77), VerseReference(surah: 41, ayah: 34),
            VerseReference(surah: 41, ayah: 35), VerseReference(surah: 41, ayah: 36), VerseReference(surah: 42, ayah: 37),
            VerseReference(surah: 42, ayah: 39), VerseReference(surah: 42, ayah: 40), VerseReference(surah: 42, ayah: 41),
            VerseReference(surah: 42, ayah: 42), VerseReference(surah: 42, ayah: 43), VerseReference(surah: 46, ayah: 35),
            VerseReference(surah: 49, ayah: 10), VerseReference(surah: 50, ayah: 39), VerseReference(surah: 68, ayah: 48)
        ],
        .motivation: [
            VerseReference(surah: 2, ayah: 45), VerseReference(surah: 2, ayah: 153), VerseReference(surah: 2, ayah: 154),
            VerseReference(surah: 2, ayah: 177), VerseReference(surah: 2, ayah: 277), VerseReference(surah: 3, ayah: 139),
            VerseReference(surah: 3, ayah: 142), VerseReference(surah: 3, ayah: 200), VerseReference(surah: 5, ayah: 35),
            VerseReference(surah: 8, ayah: 46), VerseReference(surah: 11, ayah: 115), VerseReference(surah: 13, ayah: 11),
            VerseReference(surah: 16, ayah: 96), VerseReference(surah: 16, ayah: 97), VerseReference(surah: 17, ayah: 19),
            VerseReference(surah: 18, ayah: 30), VerseReference(surah: 18, ayah: 39), VerseReference(surah: 18, ayah: 58),
            VerseReference(surah: 29, ayah: 69), VerseReference(surah: 32, ayah: 24), VerseReference(surah: 38, ayah: 44),
            VerseReference(surah: 39, ayah: 10), VerseReference(surah: 47, ayah: 7), VerseReference(surah: 53, ayah: 39),
            VerseReference(surah: 53, ayah: 40), VerseReference(surah: 53, ayah: 41), VerseReference(surah: 53, ayah: 42),
            VerseReference(surah: 94, ayah: 5), VerseReference(surah: 94, ayah: 6), VerseReference(surah: 94, ayah: 7),
            VerseReference(surah: 94, ayah: 8)
        ],
        .peace: [
            VerseReference(surah: 2, ayah: 255), VerseReference(surah: 6, ayah: 17), VerseReference(surah: 7, ayah: 55),
            VerseReference(surah: 8, ayah: 10), VerseReference(surah: 10, ayah: 62), VerseReference(surah: 10, ayah: 63),
            VerseReference(surah: 10, ayah: 64), VerseReference(surah: 11, ayah: 6), VerseReference(surah: 13, ayah: 28),
            VerseReference(surah: 16, ayah: 97), VerseReference(surah: 17, ayah: 82), VerseReference(surah: 21, ayah: 107),
            VerseReference(surah: 22, ayah: 77), VerseReference(surah: 24, ayah: 35), VerseReference(surah: 26, ayah: 80),
            VerseReference(surah: 27, ayah: 62), VerseReference(surah: 33, ayah: 41), VerseReference(surah: 33, ayah: 56),
            VerseReference(surah: 35, ayah: 2), VerseReference(surah: 39, ayah: 23), VerseReference(surah: 39, ayah: 36),
            VerseReference(surah: 41, ayah: 30), VerseReference(surah: 46, ayah: 13), VerseReference(surah: 48, ayah: 4),
            VerseReference(surah: 48, ayah: 26), VerseReference(surah: 55, ayah: 1), VerseReference(surah: 55, ayah: 60),
            VerseReference(surah: 57, ayah: 4), VerseReference(surah: 87, ayah: 1), VerseReference(surah: 97, ayah: 5)
        ],
        .gratitude: [
            VerseReference(surah: 1, ayah: 1), VerseReference(surah: 1, ayah: 2), VerseReference(surah: 1, ayah: 6),
            VerseReference(surah: 2, ayah: 52), VerseReference(surah: 2, ayah: 152), VerseReference(surah: 2, ayah: 172),
            VerseReference(surah: 2, ayah: 185), VerseReference(surah: 3, ayah: 123), VerseReference(surah: 5, ayah: 6),
            VerseReference(surah: 5, ayah: 89), VerseReference(surah: 14, ayah: 7), VerseReference(surah: 14, ayah: 34),
            VerseReference(surah: 14, ayah: 37), VerseReference(surah: 16, ayah: 14), VerseReference(surah: 16, ayah: 18),
            VerseReference(surah: 16, ayah: 53), VerseReference(surah: 16, ayah: 78), VerseReference(surah: 16, ayah: 83),
            VerseReference(surah: 17, ayah: 3), VerseReference(surah: 27, ayah: 40), VerseReference(surah: 31, ayah: 12),
            VerseReference(surah: 31, ayah: 14), VerseReference(surah: 35, ayah: 30), VerseReference(surah: 36, ayah: 35),
            VerseReference(surah: 36, ayah: 73), VerseReference(surah: 44, ayah: 32), VerseReference(surah: 47, ayah: 15),
            VerseReference(surah: 53, ayah: 32), VerseReference(surah: 55, ayah: 13), VerseReference(surah: 103, ayah: 3)
        ],
        .repentance: [
            VerseReference(surah: 2, ayah: 37), VerseReference(surah: 2, ayah: 54), VerseReference(surah: 2, ayah: 160),
            VerseReference(surah: 2, ayah: 186), VerseReference(surah: 3, ayah: 89), VerseReference(surah: 3, ayah: 135),
            VerseReference(surah: 3, ayah: 136), VerseReference(surah: 4, ayah: 17), VerseReference(surah: 4, ayah: 64),
            VerseReference(surah: 4, ayah: 110), VerseReference(surah: 5, ayah: 39), VerseReference(surah: 5, ayah: 74),
            VerseReference(surah: 7, ayah: 23), VerseReference(surah: 7, ayah: 143), VerseReference(surah: 9, ayah: 104),
            VerseReference(surah: 9, ayah: 118), VerseReference(surah: 11, ayah: 3), VerseReference(surah: 11, ayah: 90),
            VerseReference(surah: 20, ayah: 82), VerseReference(surah: 24, ayah: 33), VerseReference(surah: 25, ayah: 70),
            VerseReference(surah: 33, ayah: 24), VerseReference(surah: 33, ayah: 70), VerseReference(surah: 39, ayah: 53),
            VerseReference(surah: 40, ayah: 7), VerseReference(surah: 49, ayah: 12), VerseReference(surah: 66, ayah: 8),
            VerseReference(surah: 71, ayah: 10), VerseReference(surah: 73, ayah: 20), VerseReference(surah: 110, ayah: 3)
        ],
        .guidance: [
            VerseReference(surah: 1, ayah: 6), VerseReference(surah: 1, ayah: 7), VerseReference(surah: 2, ayah: 2),
            VerseReference(surah: 2, ayah: 185), VerseReference(surah: 2, ayah: 186), VerseReference(surah: 2, ayah: 213),
            VerseReference(surah: 2, ayah: 256), VerseReference(surah: 2, ayah: 269), VerseReference(surah: 2, ayah: 272),
            VerseReference(surah: 3, ayah: 7), VerseReference(surah: 3, ayah: 73), VerseReference(surah: 3, ayah: 101),
            VerseReference(surah: 3, ayah: 103), VerseReference(surah: 4, ayah: 175), VerseReference(surah: 5, ayah: 16),
            VerseReference(surah: 6, ayah: 71), VerseReference(surah: 6, ayah: 88), VerseReference(surah: 6, ayah: 125),
            VerseReference(surah: 10, ayah: 9), VerseReference(surah: 12, ayah: 108), VerseReference(surah: 14, ayah: 27),
            VerseReference(surah: 16, ayah: 89), VerseReference(surah: 16, ayah: 93), VerseReference(surah: 17, ayah: 9),
            VerseReference(surah: 17, ayah: 97), VerseReference(surah: 18, ayah: 17), VerseReference(surah: 24, ayah: 35),
            VerseReference(surah: 31, ayah: 32), VerseReference(surah: 35, ayah: 8), VerseReference(surah: 39, ayah: 23)
        ],
        .optimism: [
            VerseReference(surah: 2, ayah: 218), VerseReference(surah: 2, ayah: 221), VerseReference(surah: 3, ayah: 139),
            VerseReference(surah: 3, ayah: 186), VerseReference(surah: 4, ayah: 128), VerseReference(surah: 4, ayah: 130),
            VerseReference(surah: 9, ayah: 40), VerseReference(surah: 9, ayah: 55), VerseReference(surah: 11, ayah: 119),
            VerseReference(surah: 12, ayah: 87), VerseReference(surah: 12, ayah: 90), VerseReference(surah: 13, ayah: 26),
            VerseReference(surah: 15, ayah: 3), VerseReference(surah: 16, ayah: 40), VerseReference(surah: 16, ayah: 41),
            VerseReference(surah: 16, ayah: 97), VerseReference(surah: 18, ayah: 88), VerseReference(surah: 20, ayah: 74),
            VerseReference(surah: 21, ayah: 90), VerseReference(surah: 22, ayah: 77), VerseReference(surah: 24, ayah: 55),
            VerseReference(surah: 25, ayah: 20), VerseReference(surah: 28, ayah: 35), VerseReference(surah: 29, ayah: 69),
            VerseReference(surah: 32, ayah: 21), VerseReference(surah: 39, ayah: 53), VerseReference(surah: 41, ayah: 31),
            VerseReference(surah: 42, ayah: 19), VerseReference(surah: 47, ayah: 38), VerseReference(surah: 65, ayah: 2),
            VerseReference(surah: 65, ayah: 3)
        ]
    ]
}
