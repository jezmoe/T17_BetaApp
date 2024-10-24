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
            Text("Welcome to the Athlete Course! This course is designed for those with 3-5 months of weight training experience, looking to push themselves further and build on their foundational strength. This course is divided into 4 months. Good luck and keep pushing!")
                .font(.subheadline)
                .fontWeight(.light)
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

struct AthleteView_Previews: PreviewProvider {
    static var previews: some View {
        AthleteView()
    }
}

