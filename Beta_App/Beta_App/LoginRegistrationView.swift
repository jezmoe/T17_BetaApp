//
//  LoginRegistrationView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//


import SwiftUI

struct LoginRegistrationView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isRegistering: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if isRegistering {
                    Button("Register") {
                        // Handle registration logic here
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(5)
                } else {
                    Button("Login") {
                        // Handle login logic here
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(5)
                }

                Button("Switch to \(isRegistering ? "Login" : "Register")") {
                    isRegistering.toggle()
                }
                .padding()
            }
            .navigationTitle(isRegistering ? "Register" : "Login")
        }
    }
}

struct LoginRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegistrationView()
    }
}

