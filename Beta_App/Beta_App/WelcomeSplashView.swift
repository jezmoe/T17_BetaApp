//
//  WelcomeSplashView.swift
//  Beta_App
//
//  Created by Jan Rubido on 10/21/24.
//

// Mini splash screen after continue button is pressed in the user input screen.
import SwiftUI

struct WelcomeSplashView: View {
    @EnvironmentObject var userModel: UserModel
    @State private var isActive = false
    @State private var hasAnimated = false

    var body: some View {
        VStack {
            if isActive {
                ContentView()
                    .environmentObject(userModel)
            } else {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)

                    // Animation
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                        .rotationEffect(Angle(degrees: hasAnimated ? 360 : 0))
                        .onAppear {
                            withAnimation(Animation.linear(duration: 3.5).repeatForever(autoreverses: false)) {
                                self.hasAnimated = true
                            }
                        }

                    Text("Welcome \(userModel.firstName) \(userModel.lastName) to Fitness Pro!")
                        .foregroundColor(.white)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct WelcomeSplashView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeSplashView().environmentObject(UserModel())
    }
}
