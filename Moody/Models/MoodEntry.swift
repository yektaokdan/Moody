import Foundation

struct MoodEntry: Identifiable, Codable {
    let id: UUID
    let mood: Mood
    let note: String
    let date: Date
    
    init(mood: Mood, note: String, date: Date = Date()) {
        self.id = UUID()
        self.mood = mood
        self.note = note
        self.date = date
    }
} 