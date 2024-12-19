import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MoodViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                VStack(spacing: 20) {
                    MoodSelectionView(viewModel: viewModel)
                        .padding(.top)
                    
                    HStack {
                        AddNoteButton(viewModel: viewModel)
                        
                        Button(action: { viewModel.showingCycleInput = true }) {
                            Label("Döngü Kaydı", systemImage: "calendar.circle")
                                .foregroundColor(.primary)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.pink.opacity(0.2))
                                )
                        }
                    }
                    .padding(.horizontal)
                    
                    MoodHistoryList(viewModel: viewModel)
                }
                .navigationTitle("Moody")
                .sheet(isPresented: $viewModel.showingNoteInput) {
                    NoteInputView(viewModel: viewModel)
                }
                .sheet(isPresented: $viewModel.showingCycleInput) {
                    CycleInputView(viewModel: viewModel)
                }
                .background(viewModel.selectedMood.backgroundColor.opacity(0.1).ignoresSafeArea())
            }
            .tabItem {
                Label(String(localized: "Daily"), systemImage: "list.bullet")
            }
            
            MoodCalendarView(viewModel: viewModel)
                .tabItem {
                    Label(String(localized: "Calendar"), systemImage: "calendar")
                }
        }
    }
}