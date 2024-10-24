//
//  BodybuilderView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI

struct BodybuilderView: View {
    @EnvironmentObject var userModel: UserModel
    var body: some View {
        VStack {
            Text("Welcome to the Bodybuilder Course! This course is ideal for those with 1-2 years of weightlifting experience, ready to take their training to the next level. This course spans 6 months. Stay dedicated and happy lifting!")
                .font(.subheadline)
                .fontWeight(.light)
                .padding()

            ForEach(1...6, id: \.self) { month in
                NavigationLink(destination: WorkoutDetailView(focusArea: musclesForMonth(month), month: month)) {
                    Text("Start Month \(month)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            Spacer()
        }
        .navigationTitle("Bodybuilder Course")
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
        case 5:
            return ["chest", "triceps"]
        case 6:
            return ["chest", "triceps"]
        default:
            return []
        }
    }
}

struct BodybuilderView_Previews: PreviewProvider {
    static var previews: some View {
        BodybuilderView()
    }
}

