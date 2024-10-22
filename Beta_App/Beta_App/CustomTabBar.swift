//
//  CustomTabBar.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//


import SwiftUI

import SwiftUI

struct CustomTabBar: View {
    @State private var selectedTab = "Home"
    
    // Placeholder user details
    let firstName = "Jan"
    let lastName = "Rubido"

    var body: some View {
        VStack {
            switch selectedTab {
            case "Home":
                HomeView(firstName: firstName, lastName: lastName) // Now passing parameters
            case "Diet":
                DietView()
            case "Profile":
                ProfileView()
            default:
                HomeView(firstName: firstName, lastName: lastName)
            }

            HStack {
                TabBarButton(selectedTab: $selectedTab, label: "Home", imageName: "house")
                TabBarButton(selectedTab: $selectedTab, label: "Diet", imageName: "list.bullet")
                TabBarButton(selectedTab: $selectedTab, label: "Profile", imageName: "person")
            }
            .padding()
            .background(Color.white.shadow(radius: 2))
        }
    }
}

struct TabBarButton: View {
    @Binding var selectedTab: String
    let label: String
    let imageName: String

    var body: some View {
        Button(action: {
            selectedTab = label
        }) {
            VStack {
                Image(systemName: imageName)
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == label ? .green : .gray)
                Text(label)
                    .font(.caption)
                    .foregroundColor(selectedTab == label ? .green : .gray)
            }
        }
    }
}


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
