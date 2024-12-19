import SwiftUI
struct DayCell: View {
    let date: Date
    let entries: [MoodEntry]
    let cycleEntries: [CycleEntry]
    
    var body: some View {
        VStack(spacing: 2) {
            Text("\(Calendar.current.component(.day, from: date))")
                .font(.caption2)
            
            if let firstEntry = entries.first {
                Image(firstEntry.mood.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundColor(firstEntry.mood.backgroundColor)
            }
            
            if let cycleEntry = cycleEntries.first {
                Circle()
                    .fill(cycleEntry.flow.color)
                    .frame(width: 8, height: 8)
            }
        }
        .frame(height: 40)
        .padding(4)
    }
} 
