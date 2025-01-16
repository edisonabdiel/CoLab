//
//  MainView.swift
//  CoLab
//
//  Created by Edison Abdiel on 03.01.25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var appState = AppState()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Matchmaking Tab
            MatchmakingView()
                .tag(0)
                .tabItem {
                    IconSet.TabBar.matchIcon()
                }
            
            // Profile Tab
            ProfileView()
                .tag(1)
                .tabItem {
                    IconSet.TabBar.profileIcon()
                }
            
            // Settings Tab
            ConfigurationView()
                .tag(2)
                .tabItem {
                    IconSet.TabBar.settingsIcon()
                }
        }
        .tint(.blue)
        .environmentObject(appState)
    }
}

#Preview {
    MainView()
        .preferredColorScheme(.dark)
}
