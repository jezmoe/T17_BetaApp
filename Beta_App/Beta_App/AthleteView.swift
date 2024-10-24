//
//  AthleteView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI

struct AthleteView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Athlete course!")
                .font(.title)
                .padding()

            Text("Designed for those with 3-5 months experience, this course will push your limits over 4 months.")
                .padding()

            Button("Start First Month") {
                print("Athlete's First Month Started")
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .navigationTitle("Athlete Course")
    }
}

