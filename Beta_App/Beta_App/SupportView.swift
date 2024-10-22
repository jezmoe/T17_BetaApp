//
//  SupportView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

// Support page tied into profile
import SwiftUI

struct SupportView: View {
    var body: some View {
        List {
            Section(header: Text("Help & Support")) {
                Link("FAQ", destination: URL(string: "https://www.fitnessapp.com/faq")!)
                Link("Contact Us", destination: URL(string: "mailto:support@fitnessapp.com")!)
                Link("About Fitness Pro", destination: URL(string: "https://www.fitnessapp.com/about")!)
            }
        }
        .navigationTitle("Support")
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}
