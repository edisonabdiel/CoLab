import SwiftUI

struct ConfigurationView: View {
    @EnvironmentObject var appState: AppState
    @State private var isPrivateAccount = false
    @State private var showOnlineStatus = true
    @State private var pushNotifications = true
    @State private var emailAlerts = true
    @State private var selectedLanguage = "English"
    @State private var isDarkMode = true
    
    var body: some View {
        NavigationStack {
            List {
                // Profile Settings
                Section("Profile Settings") {
                    NavigationLink {
                        Text("Edit Profile View")
                    } label: {
                        Text("Edit Profile")
                    }
                    
                    HStack {
                        Text("Change Avatar")
                        Spacer()
                        Text("Edit")
                            .foregroundColor(.blue)
                    }
                }
                
                // Privacy
                Section("Privacy") {
                    Toggle("Private Account", isOn: $isPrivateAccount)
                        .tint(.green)
                    Toggle("Show Online Status", isOn: $showOnlineStatus)
                        .tint(.green)
                }
                
                // Notifications
                Section("Notifications") {
                    Toggle("Push Notifications", isOn: $pushNotifications)
                        .tint(.green)
                    Toggle("Email Alerts", isOn: $emailAlerts)
                        .tint(.green)
                }
                
                // Account Preferences
                Section("Account Preferences") {
                    HStack {
                        Text("Language")
                        Spacer()
                        Text(selectedLanguage)
                            .foregroundColor(.blue)
                    }
                    
                    HStack {
                        Text("Theme")
                        Spacer()
                        Text(isDarkMode ? "Dark" : "Light")
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ConfigurationView()
        .environmentObject(AppState())
        .preferredColorScheme(.dark)
}
