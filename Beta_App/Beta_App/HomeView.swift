//
//  HomeView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//


import SwiftUI

struct HomeView: View {
    var firstName: String
    var lastName: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello \(firstName) \(lastName)")
                .padding()
                .font(.title)
            Spacer()
        }
        .navigationBarTitle("Home", displayMode: .inline)
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(firstName: "Jan", lastName: "Rubido")
    }
}


