import SwiftUI

struct ProfileDetailView: View {
    let profile: PlaceholderProfile
    
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
                        Text(profile.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 48)
                        
                        Text("Last online: \(profile.lastOnline)")
                            .foregroundColor(.gray)
                    }
                    
                    // Bio section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Bio")
                            .font(.headline)
                        Text("I'm a passionate developer looking to collaborate on exciting projects. Let's build something amazing together!")
                            .foregroundColor(.secondary)
                    }
                    
                    // Skills section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Skills")
                            .font(.headline)
                        LazyVGrid(columns: [
                            GridItem(.adaptive(minimum: 100), spacing: 8)
                        ], spacing: 8) {
                            ForEach(profile.skills, id: \.self) { skill in
                                SkillTag(text: skill)
                            }
                        }
                    }
                    
                    // Availability section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Availability")
                            .font(.headline)
                        Text(profile.availability)
                            .foregroundColor(.secondary)
                        Text("Timezone: PST")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    // Contact button
                    Button(action: {
                        // Placeholder for contact action
                    }) {
                        Text("Contact")
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

#Preview {
    NavigationStack {
        ProfileDetailView(profile: PlaceholderProfile(
            id: "1",
            name: "@alex_johnson",
            skills: ["JavaScript", "React"],
            availability: "Available: Weekends",
            lastOnline: "2h ago"
        ))
    }
    .preferredColorScheme(.dark)
}
