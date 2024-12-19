import SwiftUI

struct CycleInputView: View {
    @ObservedObject var viewModel: MoodViewModel
    @Environment(\.dismiss) var dismiss
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(String(localized: "Date")) {
                    DatePicker(
                        String(localized: "Select Date"),
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .environment(\.locale, Locale.current)
                }
                
                Section(String(localized: "Flow")) {
                    Picker(String(localized: "Flow Intensity"), selection: $viewModel.selectedFlow) {
                        ForEach(FlowIntensity.allCases, id: \.self) { flow in
                            HStack {
                                Image(systemName: flow.icon)
                                    .foregroundColor(flow.color)
                                Text(flow.rawValue)
                            }
                            .tag(flow)
                        }
                    }
                }
                
                Section(String(localized: "Symptoms")) {
                    ForEach(CycleSymptom.allCases, id: \.self) { symptom in
                        Toggle(isOn: Binding(
                            get: { viewModel.selectedSymptoms.contains(symptom) },
                            set: { isSelected in
                                if isSelected {
                                    viewModel.selectedSymptoms.insert(symptom)
                                } else {
                                    viewModel.selectedSymptoms.remove(symptom)
                                }
                            }
                        )) {
                            HStack {
                                Image(systemName: symptom.icon)
                                Text(symptom.rawValue)
                            }
                        }
                    }
                }
                
                Section(String(localized: "Notes")) {
                    TextField(String(localized: "Add your notes..."), text: $viewModel.noteText, axis: .vertical)
                        .lineLimit(5...10)
                }
            }
            .navigationTitle(String(localized: "Cycle Record"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("İptal") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        viewModel.addCycleEntry(date: selectedDate)
                        dismiss()
                    }
                }
            }
        }
    }
} 