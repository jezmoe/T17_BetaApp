//
//  DailyView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI
import Combine

// Define a model reflecting all necessary details from the API
struct DailyWorkoutInfo: Codable, Identifiable {
    var id: String { name }
    let name: String
    let muscle: String
    let equipment: String
}

class DailyWorkoutViewModel: ObservableObject {
    @Published var workouts: [DailyWorkoutInfo] = []
    @Published var selectedWorkouts: [DailyWorkoutInfo] = []
    @Published var showMusclePicker = false
    var cancellables = Set<AnyCancellable>()

    let muscleGroups = ["abdominals", "abductors", "adductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "triceps"]
    let apiKey = "Your_API_Key"

    func fetchWorkouts(for muscle: String) {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=\(muscle)") else { return }
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [DailyWorkoutInfo].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] receivedWorkouts in
                DispatchQueue.main.async {
                    self?.selectedWorkouts = receivedWorkouts
                }
            })
            .store(in: &cancellables)
    }
}

struct DailyView: View {
    @ObservedObject var workoutViewModel = DailyWorkoutViewModel()

    var body: some View {
        List {
            Button("Show Muscle Categories") {
                workoutViewModel.showMusclePicker.toggle()
            }
            if workoutViewModel.showMusclePicker {
                ForEach(workoutViewModel.muscleGroups, id: \.self) { muscle in
                    Button(muscle) {
                        workoutViewModel.fetchWorkouts(for: muscle)
                    }
                }
            }
            ForEach(workoutViewModel.selectedWorkouts, id: \.id) { workout in
                VStack(alignment: .leading) {
                    Text(workout.name).font(.headline)
                    Text("Muscle: \(workout.muscle)")
                    Text("Equipment: \(workout.equipment)")
                }
            }
        }
        .navigationTitle("Daily Workouts")
    }
}

struct DailyWorkoutDictionaryView: View {
    @ObservedObject var workoutViewModel: DailyWorkoutViewModel

    var body: some View {
        List {
            Button("Show Muscle Categories") {
                workoutViewModel.showMusclePicker.toggle()
            }
            if workoutViewModel.showMusclePicker {
                ForEach(workoutViewModel.muscleGroups, id: \.self) { muscle in
                    Button(muscle) {
                        workoutViewModel.fetchWorkouts(for: muscle)
                    }
                }
            }
            ForEach(workoutViewModel.workouts, id: \.id) { workout in
                VStack(alignment: .leading) {
                    Text(workout.name).font(.headline)
                    Text("Muscle: \(workout.muscle)")
                    Text("Equipment: \(workout.equipment)")
                }
            }
        }
        .navigationTitle("Workout Dictionary")
    }
}




