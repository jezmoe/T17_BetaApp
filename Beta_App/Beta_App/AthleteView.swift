//
//  AthleteView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI

struct AthleteView: View {
    @EnvironmentObject var userModel: UserModel
    @State private var selectedMonth: Int? = nil

    var body: some View {
        VStack {
            Text("Welcome to the Athlete Course!")
                .font(.title)
                .padding()

            ForEach(1...4, id: \.self) { month in
                Button("Start Month \(month)") {
                    selectedMonth = month
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }

            if let month = selectedMonth {
                Text("Month \(month) Workout Plan")
                    .font(.headline)
                    .padding()

                Text("Upcoming this week:")
                    .font(.subheadline)
                    .padding()

                Text("Day 1: Agility\nDay 2: Power\nDay 3: Rest\nDay 4: Endurance")
                    .padding()
            }

            Spacer()
        }
        .navigationTitle("Athlete Course")
    }
}


