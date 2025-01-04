//
//  LoginView.swift
//  CoLab
//
//  Created by Edison Abdiel on 03.01.25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to CoLab")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Login") {
                appState.signIn(username: username)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .preferredColorScheme(.dark)
    }
}

#Preview {
    LoginView()
        .environmentObject(AppState())
}
