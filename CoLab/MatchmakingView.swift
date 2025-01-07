import SwiftUI

// Update FilterOption to only include Last Online
struct FilterOption: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var isActive: Bool
    
    static let lastOnline = FilterOption(name: "Last Online", isActive: false)
}

struct MatchmakingView: View {
    @State private var searchText = ""
    
    // Updated placeholder data
    let placeholderProfiles = [
        PlaceholderProfile(
            id: "1",
            name: "@alex_johnson",
            skills: ["JavaScript", "React", "Node.js"],
            availability: "Available: Weekends",
            lastOnline: "2h ago",
            area: "San Francisco, CA"
        ),
        PlaceholderProfile(
            id: "2",
            name: "@samantha_lee",
            skills: ["Python", "Data Analysis", "Machine Learning"],
            availability: "Available: Evening",
            lastOnline: "5m ago",
            area: "New York, NY"
        ),
        PlaceholderProfile(
            id: "3",
            name: "@michael_brown",
            skills: ["UX Design", "Figma", "Adobe XD"],
            availability: "Available: Morning",
            lastOnline: "1d ago",
            area: "London, UK"
        ),
        PlaceholderProfile(
            id: "4",
            name: "@swift_dev",
            skills: ["Swift", "SwiftUI", "iOS"],
            availability: "Available: Weekdays",
            lastOnline: "Just now",
            area: "Berlin, Germany"
        ),
        PlaceholderProfile(
            id: "5",
            name: "@web_ninja",
            skills: ["TypeScript", "Angular", "AWS"],
            availability: "Available: Evening",
            lastOnline: "30m ago",
            area: "Toronto, Canada"
        ),
        PlaceholderProfile(
            id: "6",
            name: "@mobile_guru",
            skills: ["Kotlin", "Android", "Flutter"],
            availability: "Available: Weekdays",
            lastOnline: "3h ago",
            area: "Sydney, Australia"
        )
    ]
    
    // Updated filtering logic
    var filteredProfiles: [PlaceholderProfile] {
        let lowercasedSearch = searchText.lowercased()
        
        let searchFiltered = if searchText.isEmpty {
            placeholderProfiles
        } else if searchText.hasPrefix("@") {
            // Search for specific user
            placeholderProfiles.filter { profile in
                profile.name.lowercased().contains(lowercasedSearch)
            }
        } else {
            // Global search across all fields
            placeholderProfiles.filter { profile in
                profile.name.lowercased().contains(lowercasedSearch) ||
                profile.skills.contains { $0.lowercased().contains(lowercasedSearch) } ||
                profile.area.lowercased().contains(lowercasedSearch) ||
                profile.availability.lowercased().contains(lowercasedSearch)
            }
        }
        
        // Always sort by last online
        return sorted(profiles: searchFiltered)
    }
    
    // Sorting function
    private func sorted(profiles: [PlaceholderProfile]) -> [PlaceholderProfile] {
        profiles.sorted { profile1, profile2 in
            let timeOrder = ["Just now": 1, "m ago": 2, "h ago": 3, "d ago": 4]
            let time1 = profile1.lastOnline
            let time2 = profile2.lastOnline
            
            func getSortPriority(_ time: String) -> Int {
                for (key, value) in timeOrder {
                    if time.contains(key) { return value }
                }
                return 5
            }
            
            let priority1 = getSortPriority(time1)
            let priority2 = getSortPriority(time2)
            
            if priority1 == priority2 {
                let number1 = Int(time1.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) ?? 0
                let number2 = Int(time2.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) ?? 0
                return number1 < number2
            }
            
            return priority1 < priority2
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Search Bar
                VStack(spacing: 8) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search globally or @username...", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 8)
                .background(Color(uiColor: .systemGroupedBackground))
                
                // Results count
                HStack {
                    Text("\(filteredProfiles.count) results")
                        .foregroundColor(.secondary)
                        .font(.footnote)
                        .padding(.horizontal)
                    Spacer()
                }
                .padding(.top, 8)
                
                // Profile List
                if filteredProfiles.isEmpty {
                    ContentUnavailableView(
                        "No Matches Found",
                        systemImage: "person.2.slash",
                        description: Text("Try adjusting your search criteria")
                    )
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(filteredProfiles) { profile in
                                NavigationLink {
                                    ProfileDetailView(profile: profile)
                                } label: {
                                    ProfileCard(profile: profile)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 4)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Find CoLabs")
                            .font(.title3.bold())
                        Spacer()
                        IconSet.Logo.standard()
                            .frame(width: 36, height: 36)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                }
            }
        }
    }
}

// Add FilterChip View
struct FilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? BrandKit.primary : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}

// Updated Helper Views
struct ProfileCard: View {
    let profile: PlaceholderProfile
    
    private func cleanAvailability(_ text: String) -> String {
        return text.replacingOccurrences(of: "Available: ", with: "")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Profile header
            HStack(alignment: .top, spacing: 12) {
                // Profile picture placeholder
                Circle()
                    .fill(Color(uiColor: .systemGray4))
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(profile.name)
                        .font(.headline)
                    
                    Text(profile.area)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    // Skills
                    Text(profile.skills.joined(separator: " · "))
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    HStack {
                        Text(cleanAvailability(profile.availability))
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(profile.lastOnline)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding(12)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

// Updated Model
struct PlaceholderProfile: Identifiable {
    let id: String
    let name: String
    let skills: [String]
    let availability: String
    let lastOnline: String
    let area: String
}

#Preview {
    NavigationStack {
        MatchmakingView()
    }
    .preferredColorScheme(.dark)
}
