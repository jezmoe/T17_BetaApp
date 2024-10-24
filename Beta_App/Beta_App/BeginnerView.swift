//
//  BeginnerView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI

struct BeginnerView: View {
    @EnvironmentObject var userModel: UserModel

    var body: some View {
        VStack {
            Text("Welcome to the Beginner Course! This course aims for those who are completely new to weightlifting or have taken a long break from it. This course is divided in 3 months. Good luck and let's get started!")
                .font(.subheadline)
                .fontWeight(.light)
                .padding()

            ForEach(1...3, id: \.self) { month in
                NavigationLink(destination: WorkoutDetailView(focusArea: musclesForMonth(month), month: month)) {
                    Text("Start Month \(month)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            Spacer()
        }
        .navigationTitle("Beginner Course")
    }

    func musclesForMonth(_ month: Int) -> [String] {
        switch month {
        case 1:
            return ["chest", "triceps"]
        case 2:
            return ["middle_back", "biceps"]
        case 3:
            return ["quadriceps", "traps"]
        default:
            return []
        }
    }
}

struct BeginnerView_Previews: PreviewProvider {
    static var previews: some View {
        BeginnerView()
    }
}


