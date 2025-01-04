import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Cover Image Area
                ZStack(alignment: .bottomTrailing) {
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
                        .offset(x: -16, y: 60)
                }
                
                // Content
                VStack(alignment: .leading, spacing: 16) {
                    Text(appState.currentUser?.name ?? "User Name")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 48)
                    
                    // Bio
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Bio")
                            .font(.headline)
                        Text(appState.currentUser?.bio ?? "No bio available")
                            .foregroundColor(.secondary)
                    }
                    
                    // Skills
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
                    
                    // Availability
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
                        Text("Timezone: \(appState.currentUser?.timezone ?? "Not set")")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                    }
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
