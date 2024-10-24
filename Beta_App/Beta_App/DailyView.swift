//
//  DailyView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI

struct DailyView: View {
    var body: some View {
        VStack {
            Text("Daily: Choose Your Muscles")
                .font(.title)
                .padding()

            Text("Select and customize daily workouts based on the muscle groups you want to target.")
                .padding()

            Button("Configure Today's Workout") {
                print("Daily Workout Configuration Started")
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .navigationTitle("Daily Workouts")
    }
}

