//
//  DailyView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//

//Daily Workouts view

import SwiftUI
import Combine

// Models
struct DailyWorkoutInfo: Codable, Identifiable {
    var id: String { name }
    let name: String
    let muscle: String
    let equipment: String
}

struct WorkoutDetail: Codable, Identifiable {
    var id: String { name }
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let difficulty: String
    let instructions: String
}

// ViewModel
class DailyWorkoutViewModel: ObservableObject {
    @Published var workouts: [WorkoutDetail] = []
    @Published var selectedWorkouts: [String: [WorkoutDetail]] = [:]
    @Published var selectedMuscles: Set<String> = []
    @Published var showMusclePicker = false
    @Published var showWorkoutDictionary = false
    var cancellables = Set<AnyCancellable>()

    let muscleGroups = ["abdominals", "abductors", "adductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "triceps"]
    let apiKey = "kyJ3/+EN9FnKAe09NijA9w==cOTYxVlNQwP1X3pT"

    func fetchWorkouts(for muscle: String) {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=\(muscle)") else { return }
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [WorkoutDetail].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] receivedWorkouts in
                DispatchQueue.main.async {
                    self?.workouts = receivedWorkouts
                    if let isMuscleSelected = self?.selectedMuscles.contains(muscle), isMuscleSelected {
                        self?.selectedWorkouts[muscle] = receivedWorkouts
                    } else {
                        self?.selectedWorkouts[muscle] = []
                    }
                }
            })
            .store(in: &cancellables)
    }

    func toggleMuscleSelection(muscle: String) {
        if selectedMuscles.contains(muscle) {
            selectedMuscles.remove(muscle)
            selectedWorkouts.removeValue(forKey: muscle)
        } else {
            selectedMuscles.insert(muscle)
        }
    }

    func confirmSelection() {
        selectedWorkouts = [:]
        for muscle in selectedMuscles {
            fetchWorkouts(for: muscle)
        }
    }
}

// Main Daily View
struct DailyView: View {
    @ObservedObject var dailyWorkoutViewModel = DailyWorkoutViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("What should we do today?")
                    .font(.title)
                    .padding()
                
                Button("Configure Today's Workout") {
                    dailyWorkoutViewModel.showMusclePicker.toggle()
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                if dailyWorkoutViewModel.showMusclePicker {
                    List(dailyWorkoutViewModel.muscleGroups, id: \.self) { muscle in
                        Button(action: {
                            dailyWorkoutViewModel.toggleMuscleSelection(muscle: muscle)
                        }) {
                            HStack {
                                Text(muscle)
                                Spacer()
                                if dailyWorkoutViewModel.selectedMuscles.contains(muscle) {
                                    Image(systemName: "checkmark").foregroundColor(.green)
                                }
                            }
                        }
                    }
                    Button("Confirm") {
                        dailyWorkoutViewModel.confirmSelection()
                        dailyWorkoutViewModel.showMusclePicker = false
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                
                List {
                    ForEach(Array(dailyWorkoutViewModel.selectedWorkouts.keys.sorted()), id: \.self) { muscle in
                        Section(header: Text(muscle.uppercased())) {
                            ForEach(dailyWorkoutViewModel.selectedWorkouts[muscle] ?? [], id: \.id) { workout in
                                Text("\(workout.name) - \(workout.equipment)")
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Workout Dictionary") {
                        dailyWorkoutViewModel.showWorkoutDictionary.toggle()
                    }
                }
            }
        }
        .sheet(isPresented: $dailyWorkoutViewModel.showWorkoutDictionary) {
            DailyWorkoutDictionaryView(workoutViewModel: dailyWorkoutViewModel)
        }

    }
}

// Workout Dictionary View
struct DailyWorkoutDictionaryView: View {
    @ObservedObject var workoutViewModel: DailyWorkoutViewModel

    var body: some View {
        NavigationView {
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
            .navigationBarTitle("Workout Dictionary", displayMode: .inline)
            .navigationBarItems(leading: Button("Back") {
                workoutViewModel.showWorkoutDictionary = false
            })
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
