//
//  ContentView.swift
//  CoLab
//
//  Created by Edison Abdiel on 03.01.25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 1  // Default to Profile tab (index 1)
    
    var body: some View {
        if appState.isUserLoggedIn {
            // Main tab navigation after login
            TabView(selection: $selectedTab) {
                // Matchmaking Tab
                MatchmakingView()
                    .tag(0)
                    .tabItem {
                        Image(systemName: "person.2.fill")
                        Text("Match")
                    }
                
                // Profile Tab (default landing)
                ProfileView()
                    .tag(1)
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                        Text("Profile")
                    }
                
                // Settings Tab
                ConfigurationView()
                    .tag(2)
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
            }
            .tint(.white)
        } else {
            // Login screen
            LoginView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
        .preferredColorScheme(.dark)
}
