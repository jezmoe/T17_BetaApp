//
//  BodybuilderView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI

struct BodybuilderView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Bodybuilder course!")
                .font(.title)
                .padding()

            Text("Aimed at experienced lifters, this 6-month course will take your training to the next level.")
                .padding()

            Button("Start First Month") {
                print("Bodybuilder's First Month Started")
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .navigationTitle("Bodybuilder Course")
    }
}

