import SwiftUI

struct AddNoteButton: View {
    @ObservedObject var viewModel: MoodViewModel
    
    var body: some View {
        Button(action: { viewModel.showingNoteInput = true }) {
            Label(String(localized: "Add your note"), systemImage: "square.and.pencil")
                .foregroundColor(.primary)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(viewModel.selectedMood.backgroundColor.opacity(0.2))
                )
        }
    }
} 
