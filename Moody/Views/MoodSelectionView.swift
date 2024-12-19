import SwiftUI

struct MoodSelectionView: View {
    @ObservedObject var viewModel: MoodViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(Mood.allCases, id: \.self) { mood in
                    MoodButton(
                        mood: mood,
                        isSelected: viewModel.selectedMood == mood,
                        action: { viewModel.setMood(mood) }
                    )
                }
            }
            .padding(.horizontal)
        }
    }
} 