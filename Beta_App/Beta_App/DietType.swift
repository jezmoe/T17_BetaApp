//
//  DietType.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


//
//  RecipeListView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//

import SwiftUI

enum DietType {
    case keto
    case highProtein
    case vegetarian
}

struct RecipeListView: View {
    var dietType: DietType

    var recipes: [Recipe] {
        switch dietType {
        case .keto:
            return ketoRecipes
        case .highProtein:
            return highProteinRecipes
        case .vegetarian:
            return vegetarianRecipes
        }
    }

    var body: some View {
        List(recipes) { recipe in
            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                Text(recipe.name)
                    .font(.headline)
            }
        }
        .navigationTitle(getDietTitle())
    }

    func getDietTitle() -> String {
        switch dietType {
        case .keto:
            return "Keto Recipes"
        case .highProtein:
            return "High Protein Recipes"
        case .vegetarian:
            return "Vegetarian Recipes"
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView(dietType: .keto)
    }
}
