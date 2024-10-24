//
//  SupportView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

// Support page tied into profile
//
//  SupportView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

// Updated Support page with FAQ content provided

import SwiftUI

struct SupportView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("What is Fitness Pro?")
                    .font(.headline)
                Text("""
                Fitness Pro is a comprehensive fitness app designed to help users track their workouts, monitor food intake, and achieve their fitness goals. It offers personalized workout plans and nutritional guidance for different experience levels.
                """)

                Text("Who is Fitness Pro for?")
                    .font(.headline)
                Text("""
                Fitness Pro is suitable for everyone, from beginners to seasoned athletes. It has two main categories: Athlete (for 3-5 months of experience) and Bodybuilder (for 1-2 years of experience), offering tailored suggestions based on your fitness level.
                """)

                Text("What features does Fitness Pro include?")
                    .font(.headline)
                Text("""
                Fitness Pro includes workout tracking, meal planning, and progress monitoring. It provides custom workout plans, nutrition advice, and tools to log your food intake and exercise routines.
                """)

                Text("Can I track my progress with Fitness Pro?")
                    .font(.headline)
                Text("""
                Yes, Fitness Pro allows you to track your workout performance, weight changes, and nutritional intake over time, helping you stay motivated and on top of your fitness journey.
                """)

                Text("For other inquiries, contact:")
                    .font(.headline)
                Text("support@fitnesspro.com")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        if let url = URL(string: "mailto:support@fitnesspro.com") {
                            UIApplication.shared.open(url)
                        }
                    }
            }
            .padding()
        }
        .navigationTitle("FAQ & Support")
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}
