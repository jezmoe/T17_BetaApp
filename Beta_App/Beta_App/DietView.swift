//
//  DietView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

import SwiftUI

struct DietView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 10) {
                    Text("Diet Selection")
                        .font(.headline)
                        .padding()
                    
                    CategoryCard(categoryName: "Keto", description: "High-fat, low-carb diet")
                    CategoryCard(categoryName: "Carnivore", description: "Meat-based diet")
                    CategoryCard(categoryName: "Plant-Based", description: "Vegetarian diet")
                }
            }
        }
    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
