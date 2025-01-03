//
//  ContentView.swift
//  CoLab
//
//  Created by Edison Abdiel on 03.01.25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Group {
            if appState.isUserLoggedIn {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}
