//
//  WeeklyView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI
import Combine

// Define a WorkoutInfo model reflecting all necessary details from the API
struct WorkoutInfo: Codable, Identifiable {
    var id: String { name }
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let difficulty: String
    let instructions: String
}

// ViewModel to handle fetching workouts from the API
class WorkoutViewModel: ObservableObject {
    @Published var workouts: [WorkoutInfo] = []
    @Published var selectedWorkouts: [String: [WorkoutInfo]] = [:]
    @Published var showMusclePicker = false
    var cancellables = Set<AnyCancellable>()
    let muscleGroups = ["abdominals", "abductors", "adductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "triceps"]

    let apiKey = "kyJ3/+EN9FnKAe09NijA9w==cOTYxVlNQwP1X3pT"

    func fetchWorkouts(for muscle: String, day: String? = nil) {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=\(muscle)") else { return }
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [WorkoutInfo].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] receivedWorkouts in
                DispatchQueue.main.async {
                    if let day = day {
                        self?.selectedWorkouts[day] = receivedWorkouts.filter { $0.muscle.contains(muscle) }
                    } else {
                        self?.workouts = receivedWorkouts
                    }
                }
            })
            .store(in: &cancellables)
    }

}

struct WeeklyView: View {
    @ObservedObject var workoutViewModel = WorkoutViewModel()

    var body: some View {
        List {
            ForEach(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], id: \.self) { day in
                NavigationLink(destination: DayRoutineView(day: day, workoutViewModel: workoutViewModel)) {
                    Text(day)
                }
            }
            NavigationLink(destination: WorkoutDictionaryView(workoutViewModel: workoutViewModel)) {
                Text("Workout Dictionary")
            }
        }
        .navigationTitle("Weekly Routine")
        
    }
}


struct DayRoutineView: View {
    var day: String
    @ObservedObject var workoutViewModel: WorkoutViewModel

    var body: some View {
        List {
            Button("Add Muscles") {
                workoutViewModel.showMusclePicker.toggle()
            }
            if workoutViewModel.showMusclePicker {
                ForEach(workoutViewModel.muscleGroups, id: \.self) { muscle in
                    Button(muscle) {
                        workoutViewModel.fetchWorkouts(for: muscle, day: day)
                        workoutViewModel.showMusclePicker = false
                    }
                }
            }
            ForEach(workoutViewModel.selectedWorkouts[day] ?? [], id: \.id) { workout in
                Text(workout.name)
            }
        }
        .navigationTitle("\(day) Routine")
    }
}



struct WorkoutDictionaryView: View {
    @ObservedObject var workoutViewModel: WorkoutViewModel

    var body: some View {
        List {
            Button("Show Muscle Categories") {
                workoutViewModel.showMusclePicker.toggle()
            }
            if workoutViewModel.showMusclePicker {
                ForEach(workoutViewModel.muscleGroups, id: \.self) { muscle in
                    Button(muscle) {
                        workoutViewModel.fetchWorkouts(for: muscle)
                        workoutViewModel.showMusclePicker = false
                    }
                }
            }
            ForEach(workoutViewModel.workouts, id: \.id) { workout in
                VStack(alignment: .leading) {
                    Text(workout.name).font(.headline)
                    Text("Type: \(workout.type)")
                    Text("Muscle: \(workout.muscle)")
                    Text("Equipment: \(workout.equipment)")
                    Text("Difficulty: \(workout.difficulty)")
                    Text("Instructions: \(workout.instructions)")
                }
            }
        }
        .navigationTitle("Workout Dictionary")
    }
}
