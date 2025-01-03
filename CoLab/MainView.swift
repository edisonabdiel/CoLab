import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome, \(appState.currentUser?.name ?? "User")")
                
                Button("Sign Out") {
                    appState.signOut()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("CoLab")
        }
    }
} 