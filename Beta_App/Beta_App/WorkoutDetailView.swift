//
//  WorkoutDetailView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI
import Foundation

struct Workout: Codable, Identifiable {
    var id: String { name }
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let instructions: String
    
}

    


struct WorkoutDetailView: View {
    var focusArea: String
    var month: Int
    var week: String
    @State private var workouts = [Workout]()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(focusArea): Month \(month), Week \(week)")
                    .font(.largeTitle)
                    .padding()
                
                Text("Workouts today and estimated time to finish")
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
            loadWorkouts()
        }
    }
    
    var upcomingSessionsView: some View {
        VStack {
            if month == 1 {
                upcomingSessionLink(session: "Back and Biceps", days: "Tuesday, Friday")
                upcomingSessionLink(session: "Shoulders and Legs", days: "Wednesday, Saturday")
            } else {
                
            }
        }
    }
    
    func upcomingSessionLink(session: String, days: String) -> some View {
        HStack {
            Spacer()
            Text("\(session) - \(days)")
            Spacer()
            Button("Start") {
                print("Starting \(session)")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
    
    func loadWorkouts() {
        ["chest", "triceps"].forEach { muscle in
            guard let encodedMuscle = muscle.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=\(encodedMuscle)") else {
                print("Error: Unable to form URL for muscle: \(muscle)")
                return
            }

            var request = URLRequest(url: url)
            request.setValue("kyJ3/+EN9FnKAe09NijA9w==cOTYxVlNQwP1X3pT", forHTTPHeaderField: "X-Api-Key")

            print("Making request to URL: \(url.absoluteString)")
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print("Network error for muscle \(muscle): \(error?.localizedDescription ?? "No error description")")
                    return
                }

                do {
                    let decodedWorkouts = try JSONDecoder().decode([Workout].self, from: data)
                    DispatchQueue.main.async {
                        self.workouts += decodedWorkouts.filter { $0.muscle == muscle }.prefix(5)
                        print("Loaded \(decodedWorkouts.count) workouts for muscle: \(muscle)")
                    }
                } catch {
                    print("Decoding error for muscle \(muscle): \(error)")
                }
            }.resume()
        }
    }

    
}
struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView(focusArea: "Chest and Triceps", month: 1, week: "1")
    }
}

