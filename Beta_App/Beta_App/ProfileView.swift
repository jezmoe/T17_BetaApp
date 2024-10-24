

//
//  ProfileView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

// Made name and height editable, with data persistence

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userModel: UserModel

    var body: some View {
        NavigationView {
            VStack {
                // Placeholder for default profile picture
                Image("DefaultProfilePic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .padding()

                Form {
                    Section(header: Text("Personal Information")) {
                        TextField("First Name", text: $userModel.firstName)
                            .textFieldStyle(DefaultTextFieldStyle())
                        TextField("Last Name", text: $userModel.lastName)
                            .textFieldStyle(DefaultTextFieldStyle())

                        Picker("Gender", selection: $userModel.gender) {
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    Section(header: Text("Height")) {
                        HStack {
                            Picker("Feet", selection: $userModel.heightFeet) {
                                ForEach(4...7, id: \.self) { feet in
                                    Text("\(feet) ft").tag(feet)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(maxWidth: .infinity)

                            Picker("Inches", selection: $userModel.heightInches) {
                                ForEach(0...11, id: \.self) { inch in
                                    Text("\(inch) in").tag(inch)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(maxWidth: .infinity)
                        }
                    }

                    Section(header: Text("Language")) {
                        Picker("Language", selection: $userModel.language) {
                            Text("English").tag("English")
                            Text("Spanish").tag("Spanish")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SupportView()) {
                        Text("FAQ/Support")
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(UserModel())
    }
}
