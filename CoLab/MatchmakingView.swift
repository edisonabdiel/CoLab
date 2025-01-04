import SwiftUI

// Make sure FilterOption is defined before the view
enum FilterOption: String, CaseIterable {
    case skills = "Skills"
    case area = "Area"
    case availability = "Availability"
    case lastOnline = "Last Online"
}

struct MatchmakingView: View {
    @State private var selectedFilter: FilterOption = .skills
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
        )
    ]
    
    // Updated filtering logic
    var filteredProfiles: [PlaceholderProfile] {
        if searchText.isEmpty {
            return placeholderProfiles
        }
        
        let lowercasedSearch = searchText.lowercased()
        
        return placeholderProfiles.filter { profile in
            switch selectedFilter {
            case .skills:
                return profile.skills.contains { skill in
                    skill.lowercased().contains(lowercasedSearch)
                }
            case .area:
                return profile.area.lowercased().contains(lowercasedSearch)
            case .availability:
                return profile.availability.lowercased().contains(lowercasedSearch)
            case .lastOnline:
                return profile.lastOnline.lowercased().contains(lowercasedSearch)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Search and Filter Bar
                VStack(spacing: 12) {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search \(selectedFilter.rawValue.lowercased())...", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                    }
                    .padding(.horizontal)
                    
                    // Filter Options
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(FilterOption.allCases, id: \.self) { filter in
                                FilterChip(
                                    title: filter.rawValue,
                                    isSelected: filter == selectedFilter
                                ) {
                                    selectedFilter = filter
                                    searchText = "" // Clear search when changing filters
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical, 12)
                .background(Color.gray.opacity(0.1))
                
                // Results count
                HStack {
                    Text("\(filteredProfiles.count) results")
                        .foregroundColor(.gray)
                        .font(.caption)
                        .padding(.horizontal)
                    Spacer()
                }
                .padding(.top, 8)
                
                // Profile List
                if filteredProfiles.isEmpty {
                    VStack(spacing: 20) {
                        Text("No matches found")
                            .font(.headline)
                        Text("Try adjusting your search criteria")
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 40)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(filteredProfiles) { profile in
                                NavigationLink {
                                    ProfileDetailView(profile: profile)
                                } label: {
                                    ProfileCard(profile: profile)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Find CoLabs")
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
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
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
                    
                    Text(profile.area)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
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
