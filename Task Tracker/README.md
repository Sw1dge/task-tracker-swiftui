# Task Tracker

## Overview
Task Tracker is a simple iOS application for managing tasks.
Users can create, view, mark tasks as completed, and delete them.
All data is stored locally on the device.

## Technologies
- Swift
- SwiftUI
- Core Data
- MVVM architecture
- XCTest

## Architecture
The app follows the MVVM architecture pattern:
- Model: `TaskItem` Core Data entity
- View: SwiftUI views
- ViewModel: Handles logic and Core Data interaction

Views do not access Core Data directly and communicate only through the ViewModel.

## Data Persistence
Core Data is used for local data persistence.
An in-memory persistent store is used in unit tests to isolate test data from production data.

## Testing
Unit tests are written using XCTest.
The tests verify task creation and deletion in Core Data.

## Run the App
Open the project in Xcode and run it on an iOS simulator.
