//
//  HomeView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//


import SwiftUI

struct HomeView: View {
    var firstName: String
    var lastName: String

    var body: some View {
        ScrollView {
            VStack {
                Text("Welcome \(firstName) \(lastName) to Fitness Pro!")
                    .font(.headline)
                    .padding()

                VStack(spacing: 10) {
                    CategoryCard(categoryName: "Beginner", description: "For beginners")
                    CategoryCard(categoryName: "Athlete", description: "3-5 months of experience")
                    CategoryCard(categoryName: "Bodybuilder", description: "1-2 years of experience")
                    CategoryCard(categoryName: "Weekly Routine", description: "Beginner -2 years of experience")
                    CategoryCard(categoryName: "Daily: Choose your Muscles", description: "Beginner - 2 Years of experience")
                }
            }
        }
    }
}


struct CategoryCard: View {
    var categoryName: String
    var description: String

    var body: some View {
        Button(action: {
            // Add action here for what happens when the button is tapped
            print("\(categoryName) tapped")
        }) {
            VStack {
                Image(categoryName) // Make sure these images exist in your asset catalog
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 60)
                    .cornerRadius(8)
                    .clipped()
                Text(description)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
}





