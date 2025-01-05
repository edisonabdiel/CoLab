//
//  ContentView.swift
//  CoLab
//
//  Created by Edison Abdiel on 03.01.25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 1
    
    var body: some View {
        if appState.isUserLoggedIn {
            TabView(selection: $selectedTab) {
                MatchmakingView()
                    .tag(0)
                    .tabItem {
                        IconSet.TabBar.matchIcon()
                    }
                
                ProfileView()
                    .tag(1)
                    .tabItem {
                        IconSet.TabBar.profileIcon()
                    }
                
                ConfigurationView()
                    .tag(2)
                    .tabItem {
                        IconSet.TabBar.settingsIcon()
                    }
            }
            .tint(BrandKit.primary)
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
        .preferredColorScheme(.dark)
}
