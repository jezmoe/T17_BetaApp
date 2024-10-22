//
//  Beta_AppApp.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

import SwiftUI

@main
struct Beta_AppApp: App {
    @StateObject private var userModel = UserModel()

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(userModel)
        }
    }
}


