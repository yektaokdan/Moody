import SwiftUI

struct MoodButton: View {
    let mood: Mood
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(mood.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text(mood.rawValue)
                    .font(.caption)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(isSelected ? mood.backgroundColor : Color.gray.opacity(0.2))
            )
            .foregroundColor(isSelected ? .white : .primary)
        }
    }
} 