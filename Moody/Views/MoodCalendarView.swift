import SwiftUI

struct MoodCalendarView: View {
    @ObservedObject var viewModel: MoodViewModel
    @State private var selectedMonth = Date()
    
    private let calendar = Calendar.current
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    private var daysInWeek: [String] {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        return formatter.shortWeekdaySymbols ?? ["Pt", "Sa", "Ça", "Pe", "Cu", "Ct", "Pa"]
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Ay ve yıl başlığı
                HStack {
                    Button(action: previousMonth) {
                        Image(systemName: "chevron.left")
                    }
                    
                    Spacer()
                    
                    Text(monthYearString(from: selectedMonth))
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: nextMonth) {
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.horizontal)
                
                // Haftanın günleri başlıkları
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(daysInWeek, id: \.self) { day in
                        Text(day)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Takvim günleri
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(daysInMonth(), id: \.self) { date in
                        if let date = date {
                            DayCell(
                                date: date,
                                entries: viewModel.entriesForDate(date),
                                cycleEntries: viewModel.cycleEntriesForDate(date)
                            )
                        } else {
                            Color.clear
                                .frame(height: 40)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
    
    private func daysInMonth() -> [Date?] {
        let interval = calendar.dateInterval(of: .month, for: selectedMonth)!
        let firstDay = interval.start
        
        let firstWeekday = calendar.component(.weekday, from: firstDay)
        let offsetDays = (firstWeekday + 6) % 7
        
        let daysInMonth = calendar.range(of: .day, in: .month, for: selectedMonth)!.count
        
        var dates: [Date?] = Array(repeating: nil, count: offsetDays)
        
        for day in 1...daysInMonth {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: firstDay) {
                dates.append(date)
            }
        }
        
        while dates.count < 42 { // 6 hafta x 7 gün
            dates.append(nil)
        }
        
        return dates
    }
    
    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
    
    private func previousMonth() {
        selectedMonth = calendar.date(byAdding: .month, value: -1, to: selectedMonth) ?? selectedMonth
    }
    
    private func nextMonth() {
        selectedMonth = calendar.date(byAdding: .month, value: 1, to: selectedMonth) ?? selectedMonth
    }
}
