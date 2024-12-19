import SwiftUI

struct NoteInputView: View {
    @ObservedObject var viewModel: MoodViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(String(localized: "How do you feel today?"), text: $viewModel.noteText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5...10)
                    .padding()
                
                Spacer()
            }
            .navigationTitle(String(localized: "Add Note"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(String(localized: "Cancel")) {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button(String(localized: "Save")) {
                        viewModel.addEntry()
                        dismiss()
                    }
                }
            }
        }
    }
} 