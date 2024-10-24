//
//  BodybuilderView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI

struct BodybuilderView: View {
    @EnvironmentObject var userModel: UserModel
    @State private var selectedMonth: Int? = nil

    var body: some View {
        VStack {
            Text("Welcome to the Bodybuilder Course!")
                .font(.title)
                .padding()

            ForEach(1...5, id: \.self) { month in
                Button("Start Month \(month)") {
                    selectedMonth = month
                }
                .padding()
                .background(Color.red)
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

                Text("Day 1: Chest\nDay 2: Back\nDay 3: Rest\nDay 4: Legs\nDay 5: Arms")
                    .padding()
            }

            Spacer()
        }
        .navigationTitle("Bodybuilder Course")
    }
}


