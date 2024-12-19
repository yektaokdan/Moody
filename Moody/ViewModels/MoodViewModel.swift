import Foundation
import SwiftUI

class MoodViewModel: ObservableObject {
    @Published var selectedMood: Mood = .mutlu
    @Published var noteText: String = ""
    @Published var entries: [MoodEntry] = [] {
        didSet {
            saveEntries()
        }
    }
    @Published var cycleEntries: [CycleEntry] = [] {
        didSet {
            saveCycleEntries()
        }
    }
    @Published var showingNoteInput: Bool = false
    @Published var showingCycleInput: Bool = false
    @Published var selectedSymptoms: Set<CycleSymptom> = []
    @Published var selectedFlow: FlowIntensity = .yok
    
    private let defaults = UserDefaults.standard
    private let entriesKey = "moodEntries"
    private let cycleEntriesKey = "cycleEntries"
    
    init() {
        loadEntries()
        loadCycleEntries()
    }
    
    func setMood(_ mood: Mood) {
        selectedMood = mood
    }
    
    func addEntry() {
        let entry = MoodEntry(mood: selectedMood, note: noteText)
        entries.insert(entry, at: 0)
        noteText = ""
        saveEntries()
    }
    
    func entriesForDate(_ date: Date) -> [MoodEntry] {
        let calendar = Calendar.current
        return entries.filter { calendar.isDate($0.date, inSameDayAs: date) }
    }
    
    func deleteMoodEntry(_ entry: MoodEntry) {
        if let index = entries.firstIndex(where: { $0.id == entry.id }) {
            entries.remove(at: index)
        }
    }
    
    func addCycleEntry(date: Date) {
        let entry = CycleEntry(
            date: date,
            flow: selectedFlow,
            symptoms: selectedSymptoms,
            notes: noteText
        )
        cycleEntries.insert(entry, at: 0)
        resetCycleInputs()
        saveCycleEntries()
    }
    
    private func resetCycleInputs() {
        selectedFlow = .yok
        selectedSymptoms = []
        noteText = ""
    }
    
    func cycleEntriesForDate(_ date: Date) -> [CycleEntry] {
        let calendar = Calendar.current
        return cycleEntries.filter { calendar.isDate($0.date, inSameDayAs: date) }
    }
    
    func deleteCycleEntry(_ entry: CycleEntry) {
        if let index = cycleEntries.firstIndex(where: { $0.id == entry.id }) {
            cycleEntries.remove(at: index)
        }
    }
    
    private func saveEntries() {
        if let encoded = try? JSONEncoder().encode(entries) {
            defaults.set(encoded, forKey: entriesKey)
        }
    }
    
    private func loadEntries() {
        if let data = defaults.data(forKey: entriesKey) {
            if let decoded = try? JSONDecoder().decode([MoodEntry].self, from: data) {
                entries = decoded
            }
        }
    }
    
    private func saveCycleEntries() {
        if let encoded = try? JSONEncoder().encode(cycleEntries) {
            defaults.set(encoded, forKey: cycleEntriesKey)
        }
    }
    
    private func loadCycleEntries() {
        if let data = defaults.data(forKey: cycleEntriesKey) {
            if let decoded = try? JSONDecoder().decode([CycleEntry].self, from: data) {
                cycleEntries = decoded
            }
        }
    }
} 