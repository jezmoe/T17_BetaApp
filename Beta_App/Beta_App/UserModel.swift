
//
//  UserModel.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

// Passes user data to other views.
// Now includes user's height, gender, and language.
// Implements data persistence.

import Foundation
import Combine

class UserModel: ObservableObject, Codable {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var gender: String = "Male"
    @Published var heightFeet: Int = 5
    @Published var heightInches: Int = 6
    @Published var language: String = "English"

    enum CodingKeys: String, CodingKey {
        case firstName, lastName, gender, heightFeet, heightInches, language
    }

    init() {
        load()
        setupBindings()
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        gender = try container.decode(String.self, forKey: .gender)
        heightFeet = try container.decode(Int.self, forKey: .heightFeet)
        heightInches = try container.decode(Int.self, forKey: .heightInches)
        language = try container.decode(String.self, forKey: .language)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(gender, forKey: .gender)
        try container.encode(heightFeet, forKey: .heightFeet)
        try container.encode(heightInches, forKey: .heightInches)
        try container.encode(language, forKey: .language)
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: "userModel")
        }
    }

    private func load() {
        if let savedData = UserDefaults.standard.data(forKey: "userModel"),
           let decodedModel = try? JSONDecoder().decode(UserModel.self, from: savedData) {
            self.firstName = decodedModel.firstName
            self.lastName = decodedModel.lastName
            self.gender = decodedModel.gender
            self.heightFeet = decodedModel.heightFeet
            self.heightInches = decodedModel.heightInches
            self.language = decodedModel.language
        }
    }

    private var cancellables = Set<AnyCancellable>()

    func setupBindings() {
        $firstName.sink { _ in self.save() }.store(in: &cancellables)
        $lastName.sink { _ in self.save() }.store(in: &cancellables)
        $gender.sink { _ in self.save() }.store(in: &cancellables)
        $heightFeet.sink { _ in self.save() }.store(in: &cancellables)
        $heightInches.sink { _ in self.save() }.store(in: &cancellables)
        $language.sink { _ in self.save() }.store(in: &cancellables)
    }
}
