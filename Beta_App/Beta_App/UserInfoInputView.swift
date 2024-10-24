//
//  UserInfoInputView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

// Starting page after splash screen, calls for user input
import SwiftUI

struct UserInfoInputView: View {
    @EnvironmentObject var userModel: UserModel
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var gender: String = "Male"
    @State private var heightFeet: Int = 5
    @State private var heightInches: Int = 6
    @State private var language: String = "English"
    @State private var shouldShowWelcome = false

    let feetRange = 4...7
    let inchesRange = 0...11
    let languages = ["English", "Spanish"]
    
    var isFormValid: Bool {
        !firstName.isEmpty && !lastName.isEmpty
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 50) {
                    Text("Enter Your Information:")
                        .font(.title2)
                        .bold()
                        .padding(.top, 20)

                    HStack(spacing: 10) {
                        TextField("First Name", text: $firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Last Name", text: $lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal)

                    GenderPicker(gender: $gender)
                    
                    HStack(spacing: 20) {
                        HeightPicker(label: "Feet", range: feetRange, selection: $heightFeet)
                        HeightPicker(label: "Inches", range: inchesRange, selection: $heightInches)
                    }
                    .padding(.horizontal)

                    Picker("Language", selection: $language) {
                        ForEach(languages, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()

                    if isFormValid {
                        Button("Continue", action: {
                            userModel.firstName = firstName
                            userModel.lastName = lastName
                            shouldShowWelcome = true
                        })
                        .buttonStyle(PrimaryButtonStyle())
                        .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: WelcomeSplashView().environmentObject(userModel), isActive: $shouldShowWelcome) {
                        EmptyView()
                    }
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("Welcome to Fitness Pro!")
        }
    }
}


struct GenderPicker: View {
    @Binding var gender: String

    var body: some View {
        Picker("Gender", selection: $gender) {
            Text("Male").tag("Male")
            Text("Female").tag("Female")
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct HeightPicker: View {
    var label: String
    var range: ClosedRange<Int>
    @Binding var selection: Int

    var body: some View {
        VStack {
            Text(label)
                .font(.headline)
            Picker(label, selection: $selection) {
                ForEach(range, id: \.self) { Text("\($0)") }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(height: 100)
            .clipped()
        }
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct UserInfoInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoInputView().environmentObject(UserModel())
    }
}
