//
//  HomeView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

// Home View
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userModel: UserModel

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text("Welcome \(userModel.firstName) \(userModel.lastName) to Fitness Pro!")
                        .font(.headline)
                        .padding()

                    VStack(spacing: 10) {
                        CategoryCard(categoryName: "Beginner", description: "For beginners")
                        CategoryCard(categoryName: "Athlete", description: "3-5 months of experience")
                        CategoryCard(categoryName: "Bodybuilder", description: "1-2 years of experience")
                        CategoryCard(categoryName: "Weekly Routine", description: "Beginner - 2 years of experience")
                        CategoryCard(categoryName: "Daily: Choose your Muscles", description: "Beginner - 2 Years of experience")
                    }
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
            print("\(categoryName) tapped")
        }) {
            VStack {
                Text(categoryName.uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                Image(categoryName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 60)
                    .cornerRadius(8)
                    .clipped()
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserModel())
    }
}
