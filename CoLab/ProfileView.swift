import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    
    // Define grid layout
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Cover Image Area
                ZStack(alignment: .bottomLeading) {
                    // Cover placeholder
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 200)
                    
                    // Profile picture placeholder
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 120, height: 120)
                        .overlay(
                            Circle()
                                .stroke(Color(.systemBackground), lineWidth: 4)
                        )
                        .offset(x: 16, y: 60)
                }
                
                // Content
                VStack(alignment: .leading, spacing: 24) {
                    // Name and basic info
                    VStack(alignment: .leading, spacing: 8) {
                        Text(appState.currentUser?.name ?? "User Name")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 48)
                        
                        Text(appState.currentUser?.area ?? "Location not set")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    // In a Nutshell section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("In a Nutshell")
                            .font(.headline)
                        Text(appState.currentUser?.bio ?? "No bio available")
                            .foregroundColor(.secondary)
                    }
                    
                    // Skills section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Skills")
                            .font(.headline)
                        LazyVGrid(columns: [
                            GridItem(.adaptive(minimum: 100), spacing: 8)
                        ], spacing: 8) {
                            ForEach(appState.currentUser?.skills ?? [], id: \.self) { skill in
                                SkillTag(text: skill)
                            }
                        }
                    }
                    
                    // Availability section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Availability")
                            .font(.headline)
                        if let availability = appState.currentUser?.availability {
                            ForEach(Array(availability.keys).sorted(), id: \.self) { day in
                                AvailabilityRow(
                                    day: day,
                                    time: availability[day] ?? "Not set"
                                )
                            }
                        }
                    }
                    
                    // Show, don't tell section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Show, don't tell")
                            .font(.headline)
                        
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(0..<12, id: \.self) { index in
                                PortfolioItem()
                            }
                        }
                    }
                    .padding(.top, 8)
                    
                    // Edit Profile Button
                    Button(action: {
                        // Placeholder for edit action
                    }) {
                        Text("Edit Profile")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .padding(.top, 16)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Helper Views
struct SkillTag: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.blue.opacity(0.1))
            .foregroundColor(.blue)
            .clipShape(Capsule())
    }
}

struct AvailabilityRow: View {
    let day: String
    let time: String
    
    var body: some View {
        HStack {
            Text(day)
                .fontWeight(.medium)
            Spacer()
            Text(time)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
            .environmentObject(AppState())
    }
    .preferredColorScheme(.dark)
} 
