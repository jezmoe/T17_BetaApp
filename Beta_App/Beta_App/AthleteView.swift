//
//  AthleteView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI

struct AthleteView: View {
    @EnvironmentObject var userModel: UserModel
    var body: some View {
        VStack {
            Text("Welcome to the Athlete Course!")
                .font(.title)
                .padding()

            ForEach(1...4, id: \.self) { month in
                NavigationLink(destination: WorkoutDetailView(focusArea: musclesForMonth(month), month: month)) {
                    Text("Start Month \(month)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            Spacer()
        }
        .navigationTitle("Athlete Course")
    }

    func musclesForMonth(_ month: Int) -> [String] {
        switch month {
        case 1:
            return ["chest", "triceps"]
        case 2:
            return ["back", "biceps"]
        case 3:
            return ["quadriceps", "traps"]
        case 4:
            return ["chest", "triceps"]
        default:
            return []
        }
    }
}



