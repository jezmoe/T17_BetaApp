//
//  DietView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

// Diet page
import SwiftUI

struct DietView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Diet Plans")) {
                    NavigationLink(destination: Text("Keto Diet Details")) {
                        Text("Keto")
                    }
                    NavigationLink(destination: Text("Carnivore Diet Details")) {
                        Text("Carnivore")
                    }
                    NavigationLink(destination: Text("Plant-Based Diet Details")) {
                        Text("Plant-Based")
                    }
                }
            }
            .navigationTitle("Diet Selection")
        }
    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
