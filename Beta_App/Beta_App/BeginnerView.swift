//
//  BeginnerView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI

struct BeginnerView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Beginner course!")
                .font(.title)
                .padding()

            Text("This course is for those new or returning to fitness. It spans 3 months with progressively challenging routines.")
                .padding()

            Button("Start First Month") {
                print("Beginner's First Month Started")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .navigationTitle("Beginner Course")
    }
}

