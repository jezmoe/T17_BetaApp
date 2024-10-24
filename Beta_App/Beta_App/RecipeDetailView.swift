//
//  RecipeDetailView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


//
//  RecipeDetailView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title)
                    .padding(.vertical)

                Text("Ingredients")
                    .font(.headline)
                    .padding(.vertical, 5)

                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("• \(ingredient)")
                }
                .padding(.bottom)

                Text("Directions")
                    .font(.headline)
                    .padding(.vertical, 5)

                ForEach(recipe.directions.indices, id: \.self) { index in
                    Text("\(index + 1). \(recipe.directions[index])")
                        .padding(.bottom, 2)
                }
            }
            .padding()
        }
        .navigationTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Sample recipe for preview
        let sampleRecipe = Recipe(
            name: "Sample Recipe",
            ingredients: ["Ingredient 1", "Ingredient 2"],
            directions: ["Step 1", "Step 2"]
        )
        RecipeDetailView(recipe: sampleRecipe)
    }
}
