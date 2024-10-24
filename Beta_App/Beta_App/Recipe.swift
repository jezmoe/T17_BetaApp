//
//  Recipe.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


//
//  Recipe.swift
//  Beta_App
//
//  Created by Haniel Tsegay on 10/23/24.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let ingredients: [String]
    let directions: [String]
}
