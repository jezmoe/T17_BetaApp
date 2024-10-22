//
//  ContentView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userModel: UserModel
    @State private var selectedTab = "Home"

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selectedTab {
                case "Home":
                    HomeView()
                        .environmentObject(userModel)
                case "Diet":
                    DietView()
                case "Profile":
                    ProfileView()
                default:
                    Text("Selection does not exist")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Divider()

            HStack {
                TabBarButton(icon: "house.fill", label: "Home", selectedTab: $selectedTab)
                TabBarButton(icon: "leaf.fill", label: "Diet", selectedTab: $selectedTab)
                TabBarButton(icon: "person.fill", label: "Profile", selectedTab: $selectedTab)
            }
            .frame(height: 50)
            .background(Color.black.opacity(0.8))
            .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarButton: View {
    var icon: String
    var label: String
    @Binding var selectedTab: String

    var body: some View {
        Button(action: {
            selectedTab = label
        }) {
            VStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(selectedTab == label ? .green : .gray)
                Text(label)
                    .font(.caption)
                    .foregroundColor(selectedTab == label ? .white : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
