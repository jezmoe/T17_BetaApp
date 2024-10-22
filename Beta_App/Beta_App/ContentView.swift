//
//  ContentView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Home"

    var body: some View {
        VStack {
            switch selectedTab {
            case "Home":
                Text("Home Content")
            case "Diet":
                Text("Diet Content")
            case "Profile":
                Text("Profile Content")
            default:
                Text("Home Content")
            }
            HStack {
                TabBarButton(icon: "house.fill", label: "Home", selectedTab: $selectedTab)
                TabBarButton(icon: "leaf.fill", label: "Diet", selectedTab: $selectedTab)
                TabBarButton(icon: "person.fill", label: "Profile", selectedTab: $selectedTab)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black.opacity(0.8))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


