//
//  WorkoutDetailView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//

// Controls the api for workouts. (Beginner/Athlete/Bodybuilder)
import SwiftUI

struct Workout: Codable, Identifiable {
    var id: String { name }
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let instructions: String
}

struct WorkoutDetailView: View {
    var focusArea: [String]
    var month: Int
    @State private var workouts = [Workout]()
    @State private var currentFocusArea: [String]

    init(focusArea: [String], month: Int) {
        self.focusArea = focusArea
        self.month = month
        _currentFocusArea = State(initialValue: focusArea)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(currentFocusArea.joined(separator: " and ")): Month \(month)")
                    .font(.largeTitle)
                    .padding()

                Text("Workouts today:")
                    .font(.title2)
                    .padding(.horizontal)

                ForEach(workouts, id: \.id) { workout in
                    VStack(alignment: .leading) {
                        Text(workout.name)
                            .font(.headline)
                        Text("Type: \(workout.type)")
                        Text("Equipment: \(workout.equipment)")
                        Text("Instructions: \(workout.instructions)")
                    }
                    .padding()
                }

                upcomingSessionsView
            }
        }
        .onAppear {
            loadWorkouts(for: currentFocusArea)
        }
    }

    var upcomingSessionsView: some View {
        VStack {
            if !currentFocusArea.contains("chest") && !currentFocusArea.contains("triceps") {
                switchWeekButton(session: "Chest and Triceps", days: "Monday, Thursday", muscles: ["chest", "triceps"])
            }
            if !currentFocusArea.contains("biceps") && !currentFocusArea.contains("middle_back") {
                switchWeekButton(session: "Back and Biceps", days: "Tuesday, Friday", muscles: ["biceps", "middle_back"])
            }
            if !currentFocusArea.contains("quadriceps") && !currentFocusArea.contains("traps") {
                switchWeekButton(session: "Shoulders and Legs", days: "Wednesday, Saturday", muscles: ["quadriceps", "traps"])
            }
        }
    }

    func switchWeekButton(session: String, days: String, muscles: [String]) -> some View {
        Button(action: {
            currentFocusArea = muscles
            loadWorkouts(for: muscles)
            print("Switched to \(session)")
        }) {
            HStack {
                Spacer()
                Text("\(session) - \(days)")
                Spacer()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }

    func loadWorkouts(for muscles: [String]) {
        workouts = []
        for muscle in muscles {
            guard let encodedMuscle = muscle.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=\(encodedMuscle)") else {
                print("Error: Unable to form URL for muscle: \(muscle)")
                return
            }

            var request = URLRequest(url: url)
            request.setValue("kyJ3/+EN9FnKAe09NijA9w==cOTYxVlNQwP1X3pT", forHTTPHeaderField: "X-Api-Key")

            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print("Network error for muscle \(muscle): \(error?.localizedDescription ?? "No error description")")
                    return
                }

                do {
                    let decodedWorkouts = try JSONDecoder().decode([Workout].self, from: data)
                    DispatchQueue.main.async {
                        self.workouts += decodedWorkouts.filter { $0.muscle.contains(muscle) }.prefix(5)
                        print("Loaded \(decodedWorkouts.count) workouts for muscle: \(muscle)")
                    }
                } catch {
                    print("Decoding error for muscle \(muscle): \(error)")
                }
            }.resume()
        }
    }
}




