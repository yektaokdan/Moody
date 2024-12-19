import SwiftUI

enum Mood: String, CaseIterable, Codable {
    case mutlu = "Mutlu"
    case uzgun = "Üzgün"
    case sinirli = "Sinirli"
    case heyecanli = "Heyecanlı"
    case yorgun = "Yorgun"
    
    var icon: String {
        switch self {
        case .mutlu: return "mutlu"
        case .uzgun: return "uzgun"
        case .sinirli: return "sinirli"
        case .heyecanli: return "heyecan"
        case .yorgun: return "yorgun"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .mutlu: return .green
        case .uzgun: return .blue
        case .sinirli: return .red
        case .heyecanli: return .yellow
        case .yorgun: return .purple
        }
    }
} 
