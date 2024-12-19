![Moody Mockup](https://github.com/yektaokdan/Moody/blob/main/image_for_readme/moody_mockup.png?raw=true)
# Moody - Mood & Cycle Tracking App

Moody is an iOS application designed to help users track their daily moods and menstrual cycles. Built with SwiftUI, it provides an intuitive and user-friendly interface for recording and monitoring emotional states and cycle-related information.

## Features

### Mood Tracking
- Select from various mood options (Happy, Sad, Angry, Excited, Tired)
- Add notes to mood entries
- View mood history in a chronological list
- Delete entries with swipe actions
- Calendar view for visualizing mood patterns

### Cycle Tracking
- Record menstrual flow intensity
- Track cycle-related symptoms
- Add notes to cycle entries
- Calendar integration showing cycle data
- Comprehensive symptom selection including:
  - Headache
  - Abdominal pain
  - Fatigue
  - Nausea
  - Muscle pain
  - Stress
  - Insomnia

## Technical Details

### Built With
- SwiftUI - Modern declarative UI framework
- UserDefaults - Local data persistence
- Codable - Data encoding and decoding
- MVVM Architecture - Clear separation of concerns

### Key Components
- `MoodViewModel`: Central view model managing app state and business logic
- `ContentView`: Main tab-based navigation interface
- `MoodCalendarView`: Custom calendar implementation
- `LocalizedStrings`: Full Turkish language support

### Data Models
- `MoodEntry`: Stores mood and note information
- `CycleEntry`: Manages cycle-related data including flow intensity and symptoms
- `Mood`: Enumeration of available mood states
- `FlowIntensity`: Enumeration of menstrual flow levels
- `CycleSymptom`: Enumeration of trackable symptoms

## Features
- Tab-based navigation
- Custom mood selection interface
- Interactive calendar view
- Swipe-to-delete functionality
- Confirmation dialogs for destructive actions
- Persistent storage using UserDefaults
- Localization support (Turkish)
- Dark mode support
- Custom UI components

## Requirements
- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Installation
1. Clone the repository
2. Open `Moody.xcodeproj` in Xcode
3. Build and run the project

## Architecture
The app follows the MVVM (Model-View-ViewModel) architecture pattern:
- **Models**: Data structures and business logic
- **Views**: User interface components
- **ViewModels**: State management and business logic

## Future Improvements
- Cloud sync support
- Statistical analysis of mood patterns
- Export functionality for health apps integration
- Additional language support
- Customizable mood options
- Reminder notifications

## License
This project is licensed under the MIT License - see the LICENSE file for details

## Acknowledgments
- Icons and design inspiration from Apple's SF Symbols
- SwiftUI framework and community 
