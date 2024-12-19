import SwiftUI

struct MoodHistoryList: View {
    @ObservedObject var viewModel: MoodViewModel
    @State private var showingDeleteAlert = false
    @State private var entryToDelete: MoodEntry?
    
    var body: some View {
        List {
            ForEach(viewModel.entries) { entry in
                HStack {
                    Image(entry.mood.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(entry.mood.backgroundColor)
                    
                    VStack(alignment: .leading) {
                        Text(entry.note)
                            .lineLimit(2)
                        
                        Text(formatDate(entry.date))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        entryToDelete = entry
                        showingDeleteAlert = true
                    } label: {
                        Label(String(localized: "Delete"), systemImage: "trash")
                    }
                }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .padding(.horizontal)
        .alert(String(localized: "Delete Entry"), isPresented: $showingDeleteAlert) {
            Button(String(localized: "Cancel"), role: .cancel) {}
            Button(String(localized: "Delete"), role: .destructive) {
                if let entry = entryToDelete {
                    viewModel.deleteMoodEntry(entry)
                }
            }
        } message: {
            Text(String(localized: "Are you sure you want to delete this entry?"))
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
} 