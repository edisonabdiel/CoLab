//
//  MainView.swift
//  CoLab
//
//  Created by Edison Abdiel on 03.01.25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Matchmaking Tab
            MatchmakingView()
                .tag(0)
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Match")
                }
            
            // Profile Tab
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
    }
}

#Preview {
    MainView()
        .environmentObject(AppState())
        .preferredColorScheme(.dark)
}
