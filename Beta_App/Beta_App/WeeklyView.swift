//
//  WeeklyView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/23/24.
//


import SwiftUI

struct WeeklyView: View {
    var body: some View {
        List {
            Section(header: Text("Weekly Routine")) {
                ForEach(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], id: \.self) { day in
                    Text("\(day) - Update Routine")
                }
            }
        }
        .navigationTitle("Weekly Routine")
    }
}

