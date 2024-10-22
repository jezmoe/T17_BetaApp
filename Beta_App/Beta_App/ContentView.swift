//
//  ContentView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    var body: some View {
        HomeView(firstName: firstName, lastName: lastName)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


