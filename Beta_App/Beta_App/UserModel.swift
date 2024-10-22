//
//  UserModel.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

// Passes first and last name ot other views.
// Modify in future to include user's height and weight, gender, etc.
import Foundation
import Combine

class UserModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
}
