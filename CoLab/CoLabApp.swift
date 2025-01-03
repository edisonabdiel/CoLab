//
//  CoLabApp.swift
//  CoLab
//
//  Created by Edison Abdiel on 03.01.25.
//

import SwiftUI

@main
struct CoLabApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}

class AppState: ObservableObject {
    @Published var isUserLoggedIn = false
    @Published var currentUser: User?
    
    func signOut() {
        isUserLoggedIn = false
        currentUser = nil
    }
}

struct User: Identifiable {
    let id: String
    let name: String
}
