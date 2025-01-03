import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to CoLab")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Login") {
                // Simulate login - replace with actual authentication
                appState.isUserLoggedIn = true
                appState.currentUser = User(id: "1", name: username)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
} 