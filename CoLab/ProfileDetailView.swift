import SwiftUI

struct ProfileDetailView: View {
    let profile: PlaceholderProfile
    
    // Define grid layout
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // Helper function to clean availability text
    private func cleanAvailability(_ text: String) -> String {
        return text.replacingOccurrences(of: "Available: ", with: "")
    }
    
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
                    // Name and basic info with Poke button
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(profile.name)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text(profile.area)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text("Last online: \(profile.lastOnline)")
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Placeholder for poke action
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: "hand.point.right.fill")
                                Text("Poke")
                            }
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.green)
                            .cornerRadius(20)
                        }
                    }
                    .padding(.top, 48)
                    
                    // In a Nutshell section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("In a Nutshell")
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
                        Text(cleanAvailability(profile.availability))
                            .foregroundColor(.secondary)
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
            lastOnline: "2h ago",
            area: "San Francisco, CA"
        ))
    }
    .preferredColorScheme(.dark)
}
