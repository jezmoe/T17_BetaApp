//
//  WelcomeSplashView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//


import SwiftUI

struct WelcomeSplashView: View {
    var firstName: String
    var lastName: String
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            HomeView(firstName: firstName, lastName: lastName)
        } else {
            Text("Welcome \(firstName) \(lastName) to Fitness Pro!")
                .foregroundColor(.white)
                .background(Color.black)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
        }
    }
}

struct WelcomeSplashView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeSplashView(firstName: "First Name", lastName: "Last Name")
    }
}
