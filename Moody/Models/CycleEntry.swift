import Foundation
import SwiftUI
struct CycleEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let flow: FlowIntensity
    let symptoms: Set<CycleSymptom>
    let notes: String
    
    init(date: Date = Date(), flow: FlowIntensity, symptoms: Set<CycleSymptom> = [], notes: String = "") {
        self.id = UUID()
        self.date = date
        self.flow = flow
        self.symptoms = symptoms
        self.notes = notes
    }
}

enum FlowIntensity: String, CaseIterable, Codable {
    case yok = "Yok"
    case hafif = "Hafif"
    case orta = "Orta"
    case yogun = "Yoğun"
    
    var icon: String {
        switch self {
        case .yok: return "circle"
        case .hafif: return "circle.fill"
        case .orta: return "circle.fill"
        case .yogun: return "circle.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .yok: return .gray
        case .hafif: return .pink.opacity(0.3)
        case .orta: return .pink.opacity(0.6)
        case .yogun: return .pink.opacity(0.9)
        }
    }
}

enum CycleSymptom: String, CaseIterable, Codable {
    case basAgrisi = "Baş Ağrısı"
    case karinAgrisi = "Karın Ağrısı"
    case yorgunluk = "Yorgunluk"
    case bulanti = "Bulantı"
    case kasAgrisi = "Kas Ağrısı"
    case stres = "Stres"
    case uykusuzluk = "Uykusuzluk"
    
    var icon: String {
        switch self {
        case .basAgrisi: return "head.fill"
        case .karinAgrisi: return "figure.walk"
        case .yorgunluk: return "zzz"
        case .bulanti: return "face.smiling"
        case .kasAgrisi: return "figure.walk"
        case .stres: return "brain.head.profile"
        case .uykusuzluk: return "bed.double.fill"
        }
    }
} 
