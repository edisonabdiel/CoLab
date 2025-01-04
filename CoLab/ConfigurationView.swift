import SwiftUI

struct ConfigurationView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        List {
            Section("Account") {
                Button(role: .destructive) {
                    appState.signOut()
                } label: {
                    Label("Sign Out", systemImage: "rectangle.portrait.and.arrow.right")
                }
            }
            
            Section("App Settings") {
                // We'll add more settings here later
                NavigationLink {
                    Text("Notifications")
                } label: {
                    Label("Notifications", systemImage: "bell.fill")
                }
                
                NavigationLink {
                    Text("Privacy")
                } label: {
                    Label("Privacy", systemImage: "lock.fill")
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        ConfigurationView()
            .environmentObject(AppState())
    }
    .preferredColorScheme(.dark)
}
