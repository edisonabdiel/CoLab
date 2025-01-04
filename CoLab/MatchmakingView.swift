import SwiftUI

struct MatchmakingView: View {
    // Updated placeholder data with skills and availability
    let placeholderProfiles = [
        PlaceholderProfile(
            id: "1",
            name: "@alex_johnson",
            skills: ["JavaScript", "React"],
            availability: "Available: Weekends",
            lastOnline: "2h ago"
        ),
        PlaceholderProfile(
            id: "2",
            name: "@samantha_lee",
            skills: ["Python", "Data Analysis"],
            availability: "Available: Evening",
            lastOnline: "5m ago"
        ),
        PlaceholderProfile(
            id: "3",
            name: "@michael_brown",
            skills: ["UX Design", "Figma"],
            availability: "Available: Morning",
            lastOnline: "1d ago"
        ),
        PlaceholderProfile(
            id: "4",
            name: "@swift_dev",
            skills: ["Swift", "SwiftUI"],
            availability: "Available: Weekdays",
            lastOnline: "Just now"
        )
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(placeholderProfiles) { profile in
                        NavigationLink {
                            ProfileDetailView(profile: profile)
                        } label: {
                            ProfileCard(profile: profile)
                                .foregroundColor(.primary) // This ensures text color stays consistent
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Find Partners")
        }
    }
}

// Updated Helper Views
struct ProfileCard: View {
    let profile: PlaceholderProfile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Profile header
            HStack(spacing: 16) {
                // Profile picture placeholder
                Circle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(profile.name)
                        .font(.headline)
                    
                    // Skills
                    Text("Skills: \(profile.skills.joined(separator: ", "))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    // Availability
                    Text(profile.availability)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            
            // Last online status
            Text("Last online: \(profile.lastOnline)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .contentShape(Rectangle())
    }
}

// Updated Model
struct PlaceholderProfile: Identifiable {
    let id: String
    let name: String
    let skills: [String]
    let availability: String
    let lastOnline: String
}

#Preview {
    NavigationStack {
        MatchmakingView()
    }
    .preferredColorScheme(.dark)
}
