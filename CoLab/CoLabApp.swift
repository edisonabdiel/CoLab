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
    
    func signIn(username: String) {
        currentUser = User(
            id: "1",
            name: username,
            bio: "iOS Developer passionate about creating beautiful and functional apps. Looking for exciting projects to collaborate on.",
            skills: ["Swift", "SwiftUI", "UIKit", "Git", "iOS", "Xcode"],
            availability: [
                "Weekdays": "9:00 AM - 5:00 PM",
                "Weekends": "Not Available"
            ],
            timezone: "PST"
        )
        isUserLoggedIn = true
    }
}

struct User: Identifiable {
    let id: String
    let name: String
    let bio: String
    let skills: [String]
    let availability: [String: String]
    let timezone: String
}
