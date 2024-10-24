//
//  DietView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

import SwiftUI

struct DietView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 10) {
                        Text("Diet Selection")
                            .font(.headline)
                            .padding()
                        
                        NavigationLink(destination: RecipeListView(dietType: .keto)) {
                            CategoryCard(categoryName: "Keto", description: "High-fat, low-carb diet")
                        }
                        
                        NavigationLink(destination: RecipeListView(dietType: .highProtein)) {
                            CategoryCard(categoryName: "High Protein", description: "High-protein diet")
                        }
                        
                        NavigationLink(destination: RecipeListView(dietType: .vegetarian)) {
                            CategoryCard(categoryName: "Vegetarian", description: "Plant-based diet")
                        }
                    }
                }
            }
            .navigationTitle("Diet Selection")
        }
    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
