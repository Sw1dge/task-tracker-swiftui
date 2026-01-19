# Task Tracker (iOS)

A simple Task Tracker iOS application built with **SwiftUI** and **Core Data**.  
The app allows users to create, edit, delete, and track tasks with due dates and completion status.

---

## Features

- Create, edit and delete tasks
- Mark tasks as completed
- Due date support with overdue highlighting
- Tasks are sorted:
  - Active tasks first (closest due date on top)
  - Completed tasks at the bottom
- Light / Dark / System theme support
- Persistent storage using Core Data

---

## Tech Stack

- Swift
- SwiftUI
- Core Data
- MVVM architecture
- XCTest (basic unit tests)

---

## Architecture

The project follows the **MVVM** pattern:

- **View** – SwiftUI views
- **ViewModel** – business logic and data handling
- **Model** – Core Data entities

---

## Project Structure

TaskTracker/
├── Views/
│ ├── TaskListView.swift
│ ├── TaskDetailView.swift
│ └── TaskCreateView.swift
├── ViewModels/
│ └── TaskListViewModel.swift
├── CoreData/
│ └── PersistenceController.swift
├── Theme/
│ └── ThemeManager.swift
├── Tests/
│ └── TaskTrackerTests.swift

---

## Getting Started

1. Clone the repository:
git clone https://github.com/Sw1dge/task-tracker-swiftui

2. Open the project in Xcode:
open TaskTracker.xcodeproj

3. Run the app on a simulator or real device.

---

## Tests

The project includes basic unit tests for Core Data operations:
- Task creation
- Task deletion

Tests can be run from **Xcode → Test Navigator**.

---

## What This Project Demonstrates

- Working with Core Data in SwiftUI
- State management and data flow using bindings
- Navigation and modal views
- Custom UI components (custom toggle style)
- Basic unit testing with XCTest
- Clean project structure suitable for a junior portfolio

---

## License

This project is licensed under the **MIT License**.

---

## Author

**Illia Fedorov**  
Junior iOS Developer
